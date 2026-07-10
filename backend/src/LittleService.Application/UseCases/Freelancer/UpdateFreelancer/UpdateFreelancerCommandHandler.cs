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
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<UpdateFreelancerCommandHandler> _logger;

    public UpdateFreelancerCommandHandler(IUnitOfWork unitOfWork, IFileStorageService fileStorageService, ILogger<UpdateFreelancerCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
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

        var userDto = new UserDto
        {
            Id = user.Id,
            Name = user.Name,
            Email = user.Email,
            ProfilePictureUrl = user.ProfilePictureUrl,
            CreatedAt = user.CreatedAt,
            UpdatedAt = user.UpdatedAt ?? user.CreatedAt,
            Roles = user.UserRoles.Select(ur => new RoleDto
            {
                Id = ur.Role.Id,
                Name = ur.Role.Name,
                Description = ur.Role.Description
            }).ToList(),
            Freelancer = user.Freelancer is null ? null : new FreelancerDto
            {
                UserId = user.Freelancer.Id,
                Bio = user.Freelancer.Bio,
                Profession = user.Freelancer.Profession,
                RatingAverage = user.Freelancer.RatingAverage,
                RatingCount = user.Freelancer.RatingCount,
                CompletedJobs = user.Freelancer.CompletedJobs
            },
            Client = user.Client is null ? null : new ClientDto
            {
                UserId = user.Client.Id,
                Address = user.Client.Address,
                TotalContracts = user.Client.TotalContracts
            }
        };
        _logger.LogInformation("Freelancer actualizado correctamente");
        return Result<UpdateFreelancerResult>.Success(new UpdateFreelancerResult { User = userDto });
    }
}
