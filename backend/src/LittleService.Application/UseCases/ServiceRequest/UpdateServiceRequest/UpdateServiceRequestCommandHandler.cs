using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;

public class UpdateServiceRequestCommandHandler : IRequestHandler<UpdateServiceRequestCommand, Result<UpdateServiceRequestResult>>
{
    private const string PhotoFolder = "service-requests";

    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<UpdateServiceRequestCommandHandler> _logger;

    public UpdateServiceRequestCommandHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<UpdateServiceRequestCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<UpdateServiceRequestResult>> Handle(UpdateServiceRequestCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<UpdateServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<UpdateServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            command.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<UpdateServiceRequestResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<UpdateServiceRequestResult>.Failure("No tienes permisos para modificar esta solicitud", "FORBIDDEN");

        var deletedPhotoIds = req.DeletedPhotoIds ?? new List<Guid>();
        var newPhotos = command.NewPhotos ?? new List<ServiceRequestPhotoUploadInput>();

        var photoValidation = ServiceRequestPhotoValidator.ValidatePhotos(newPhotos);
        if (!photoValidation.IsSuccess)
            return Result<UpdateServiceRequestResult>.Failure(photoValidation.Error!, photoValidation.ErrorCode);

        var countValidation = ServiceRequestPhotoValidator.ValidatePhotoCount(
            serviceRequest.Photos.Count,
            deletedPhotoIds.Count,
            newPhotos.Count);
        if (!countValidation.IsSuccess)
            return Result<UpdateServiceRequestResult>.Failure(countValidation.Error!, countValidation.ErrorCode);

        if (req.ClearPrice && req.Price.HasValue)
        {
            return Result<UpdateServiceRequestResult>.Failure(
                "No se puede enviar precio y clearPrice al mismo tiempo",
                "INVALID_PRICE_UPDATE");
        }

        var savedPhotoPaths = new List<string>();
        var deletedPhotoPaths = new List<string>();

        try
        {
            var hasTextChanges = !string.IsNullOrWhiteSpace(req.Title)
                || req.Description != null
                || req.Location != null;

            if (hasTextChanges)
            {
                var title = string.IsNullOrWhiteSpace(req.Title) ? serviceRequest.Title : req.Title;
                var description = req.Description ?? serviceRequest.Description;
                var location = req.Location ?? serviceRequest.Location;
                serviceRequest.UpdateDetails(title, description, location);
            }

            if (req.ClearPrice)
            {
                serviceRequest.ClearPrice();
            }
            else if (req.Price.HasValue)
            {
                serviceRequest.UpdatePrice(req.Price.Value);
            }

            foreach (var photoId in deletedPhotoIds)
            {
                var removedPhoto = serviceRequest.RemovePhoto(photoId);
                deletedPhotoPaths.Add(removedPhoto.FilePath);
            }
        }
        catch (DomainException ex)
        {
            return Result<UpdateServiceRequestResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            foreach (var photo in newPhotos)
            {
                var filePath = await _fileStorageService.SaveFileAsync(
                    photo.Content,
                    photo.FileName,
                    PhotoFolder,
                    cancellationToken);

                savedPhotoPaths.Add(filePath);
                serviceRequest.AddPhoto(filePath);
            }

            await _unitOfWork.ServiceRequests.UpdateAsync(serviceRequest, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            await DeleteSavedPhotosAsync(savedPhotoPaths, cancellationToken);
            _logger.LogError(ex, "Error al actualizar la solicitud de servicio {Id}", command.ServiceRequestId);
            return Result<UpdateServiceRequestResult>.Failure(
                "Error al actualizar la solicitud de servicio",
                "UPDATE_SERVICE_REQUEST_ERROR");
        }

        foreach (var path in deletedPhotoPaths)
        {
            try
            {
                await _fileStorageService.DeleteFileAsync(path, cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, "No se pudo eliminar la foto {Path} tras actualización", path);
            }
        }

        var dto = new ServiceRequestDetailDto
        {
            Id = serviceRequest.Id,
            Title = serviceRequest.Title,
            Description = serviceRequest.Description,
            Location = serviceRequest.Location,
            Status = serviceRequest.Status.ToString(),
            Price = serviceRequest.Price,
            ClientId = serviceRequest.ClientId,
            FreelancerPickedId = serviceRequest.FreelancerPickedId,
            ApplicationsCount = serviceRequest.FreelancerApplications.Count,
            Photos = serviceRequest.Photos.Select(p => new ServiceRequestPhotoDto
            {
                Id = p.Id,
                FilePath = _fileStorageService.GetFileUrl(p.FilePath)
            }).ToList(),
            CreatedAt = serviceRequest.CreatedAt,
            UpdatedAt = serviceRequest.UpdatedAt
        };

        return Result<UpdateServiceRequestResult>.Success(new UpdateServiceRequestResult { ServiceRequest = dto });
    }

    private async Task DeleteSavedPhotosAsync(IEnumerable<string> paths, CancellationToken cancellationToken)
    {
        foreach (var path in paths)
        {
            try
            {
                await _fileStorageService.DeleteFileAsync(path, cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, "No se pudo eliminar la foto {Path} tras fallo de actualización", path);
            }
        }
    }
}
