using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;

public class CreateServiceRequestCommandHandler : IRequestHandler<CreateServiceRequestCommand, Result<CreateServiceRequestResult>>
{
    private const string PhotoFolder = "service-requests";

    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<CreateServiceRequestCommandHandler> _logger;

    public CreateServiceRequestCommandHandler(
        IUnitOfWork unitOfWork,
        IFileStorageService fileStorageService,
        ILogger<CreateServiceRequestCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<CreateServiceRequestResult>> Handle(CreateServiceRequestCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CreateServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<CreateServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var photoValidation = ServiceRequestPhotoValidator.ValidatePhotos(req.Photos);
        if (!photoValidation.IsSuccess)
            return Result<CreateServiceRequestResult>.Failure(photoValidation.Error!, photoValidation.ErrorCode);

        Domain.Entities.ServiceRequest serviceRequest;
        try
        {
            serviceRequest = Domain.Entities.ServiceRequest.Create(
                req.Title,
                req.Description,
                req.Location,
                user.Client.Id,
                req.Price);
        }
        catch (Domain.Exceptions.DomainException ex)
        {
            return Result<CreateServiceRequestResult>.Failure(ex.Message, ex.ErrorCode);
        }

        var savedPhotoPaths = new List<string>();

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.ServiceRequests.AddAsync(serviceRequest, cancellationToken);

            foreach (var photo in req.Photos)
            {
                var filePath = await _fileStorageService.SaveFileAsync(
                    photo.Content,
                    photo.FileName,
                    PhotoFolder,
                    cancellationToken);

                savedPhotoPaths.Add(filePath);
                serviceRequest.Photos.Add(ServiceRequestPhoto.Create(serviceRequest.Id, filePath));
            }

            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            await DeleteSavedPhotosAsync(savedPhotoPaths, cancellationToken);
            _logger.LogError(ex, "Error al crear la solicitud de servicio");
            return Result<CreateServiceRequestResult>.Failure("Error al crear la solicitud de servicio", "CREATE_SERVICE_REQUEST_ERROR");
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

        _logger.LogInformation("ServiceRequest {Id} creado por cliente {ClientId}", serviceRequest.Id, user.Client.Id);
        return Result<CreateServiceRequestResult>.Success(new CreateServiceRequestResult { ServiceRequest = dto });
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
                _logger.LogWarning(ex, "No se pudo eliminar la foto {Path} tras fallo de creación", path);
            }
        }
    }
}
