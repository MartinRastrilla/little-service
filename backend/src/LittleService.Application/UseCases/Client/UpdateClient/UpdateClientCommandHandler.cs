using AutoMapper;
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
    private readonly IMapper _mapper;
    private readonly IFileStorageService _fileStorageService;
    private readonly ILogger<UpdateClientCommandHandler> _logger;

    public UpdateClientCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, IFileStorageService fileStorageService, ILogger<UpdateClientCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
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

        var userDto = _mapper.Map<UserDto>(user);
        _logger.LogInformation("Cliente actualizado correctamente");
        return Result<UpdateClientResult>.Success(new UpdateClientResult { User = userDto });
    }
}
