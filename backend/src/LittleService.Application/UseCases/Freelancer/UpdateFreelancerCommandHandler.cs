using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.UpdateFreelancer;

public class UpdateFreelancerCommandHandler
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

    public async Task<Result<UpdateFreelancerResult>> HandleAsync(UpdateFreelancerCommand command, CancellationToken cancellationToken = default)
    {
        var hasChanges = false;
        //? 1. Verify user exists
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
        {
            return Result<UpdateFreelancerResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        }

        //? 2. Verify user has Freelancer role
        if (user.Freelancer == null)
        {
            return Result<UpdateFreelancerResult>.Failure("Freelancer no encontrado", "FREELANCER_NOT_FOUND");
        }

        //? 3. Update freelancer Name
        if (!string.IsNullOrWhiteSpace(command.Name))
        {
            user.UpdateName(command.Name);
            hasChanges = true;
        }

        //? 4. Update freelancer Bio
        if (!string.IsNullOrWhiteSpace(command.Bio))
        {
            user.Freelancer.UpdateBio(command.Bio);
            hasChanges = true;
        }

        //? 5. Update freelancer Profile Picture
        if (command.ProfilePicture != null && !string.IsNullOrEmpty(command.ProfilePictureFileName))
        {
            var profilePictureUrl = await _fileStorageService.SaveFileAsync(command.ProfilePicture, command.ProfilePictureFileName, "profiles", cancellationToken);
            if (profilePictureUrl == null)
            {
                return Result<UpdateFreelancerResult>.Failure("Error al subir la foto de perfil", "PROFILE_PICTURE_UPLOAD_ERROR");
            }
            user.UpdateProfilePicture(profilePictureUrl);
            hasChanges = true;
        }

        //? 6. Update user
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
        //? 7. Map to DTO
        var userDto = _mapper.Map<UserDto>(user);
        _logger.LogInformation("Freelancer actualizado correctamente");
        return Result<UpdateFreelancerResult>.Success(new UpdateFreelancerResult
        {
            User = userDto
        });
    }
}