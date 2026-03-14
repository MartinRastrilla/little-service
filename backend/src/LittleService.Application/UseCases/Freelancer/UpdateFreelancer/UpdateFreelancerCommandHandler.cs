using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.UpdateFreelancer;

public class UpdateFreelancerCommandHandler : IRequestHandler<UpdateFreelancerCommand, Result<UpdateFreelancerResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<UpdateFreelancerCommandHandler> _logger;

    public UpdateFreelancerCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, IFileStorageService fileStorageService, ILogger<UpdateFreelancerCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<UpdateFreelancerResult>> Handle(UpdateFreelancerCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;
        var hasChanges = false;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<UpdateFreelancerResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<UpdateFreelancerResult>.Failure("Freelancer no encontrado", "FREELANCER_NOT_FOUND");

        if (!string.IsNullOrWhiteSpace(req.Name))
        {
            user.UpdateName(req.Name);
            hasChanges = true;
        }
        if (!string.IsNullOrWhiteSpace(req.Bio))
        {
            user.Freelancer.UpdateBio(req.Bio);
            hasChanges = true;
        }
        if (req.Profession != null)
        {
            user.Freelancer.UpdateProfession(req.Profession);
            hasChanges = true;
        }
        if (req.ProfilePicture != null && !string.IsNullOrEmpty(req.ProfilePictureFileName))
        {
            var profilePictureUrl = await _fileStorageService.SaveFileAsync(req.ProfilePicture, req.ProfilePictureFileName, "profiles", cancellationToken);
            if (profilePictureUrl == null)
                return Result<UpdateFreelancerResult>.Failure("Error al subir la foto de perfil", "PROFILE_PICTURE_UPLOAD_ERROR");
            user.UpdateProfilePicture(profilePictureUrl);
            hasChanges = true;
        }

        if (hasChanges)
        {
            await _unitOfWork.BeginTransactionAsync(cancellationToken);
            try
            {
                user.UpdatedAt = DateTime.UtcNow;
                await _unitOfWork.Users.UpdateAsync(user, cancellationToken);
                await _unitOfWork.SaveChangesAsync(cancellationToken);
                await _unitOfWork.CommitTransactionAsync(cancellationToken);
            }
            catch (Exception ex)
            {
                await _unitOfWork.RollbackTransactionAsync(cancellationToken);
                _logger.LogError(ex, "Error al actualizar el freelancer");
                return Result<UpdateFreelancerResult>.Failure("Error al actualizar el freelancer", "UPDATE_FREELANCER_ERROR");
            }
        }

        var userDto = _mapper.Map<UserDto>(user);
        _logger.LogInformation("Freelancer actualizado correctamente");
        return Result<UpdateFreelancerResult>.Success(new UpdateFreelancerResult { User = userDto });
    }
}
