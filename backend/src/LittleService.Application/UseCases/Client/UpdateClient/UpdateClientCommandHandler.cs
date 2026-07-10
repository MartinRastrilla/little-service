using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Client.UpdateClient;

public class UpdateClientCommandHandler : IRequestHandler<UpdateClientCommand, Result<UpdateClientResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<UpdateClientCommandHandler> _logger;

    public UpdateClientCommandHandler(IUnitOfWork unitOfWork, IFileStorageService fileStorageService, ILogger<UpdateClientCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _fileStorageService = fileStorageService;
        _logger = logger;
    }

    public async ValueTask<Result<UpdateClientResult>> Handle(UpdateClientCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;
        var hasChanges = false;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<UpdateClientResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<UpdateClientResult>.Failure("Cliente no encontrado", "CLIENT_NOT_FOUND");

        if (!string.IsNullOrWhiteSpace(req.Name))
        {
            user.UpdateName(req.Name);
            hasChanges = true;
        }

        if (req.Address != null)
        {
            user.Client.UpdateAddress(req.Address);
            hasChanges = true;
        }

        if (req.ProfilePicture != null && !string.IsNullOrEmpty(req.ProfilePictureFileName))
        {
            var profilePictureUrl = await _fileStorageService.SaveFileAsync(req.ProfilePicture, req.ProfilePictureFileName, "profiles", cancellationToken);
            if (profilePictureUrl == null)
                return Result<UpdateClientResult>.Failure("Error al subir la foto de perfil", "PROFILE_PICTURE_UPLOAD_ERROR");
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
                _logger.LogError(ex, "Error al actualizar el cliente");
                return Result<UpdateClientResult>.Failure("Error al actualizar el cliente", "UPDATE_CLIENT_ERROR");
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
        _logger.LogInformation("Cliente actualizado correctamente");
        return Result<UpdateClientResult>.Success(new UpdateClientResult { User = userDto });
    }
}
