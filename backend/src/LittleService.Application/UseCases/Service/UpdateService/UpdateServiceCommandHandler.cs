using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.UpdateService;

public class UpdateServiceCommandHandler : IRequestHandler<UpdateServiceCommand, Result<UpdateServiceResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<UpdateServiceCommandHandler> _logger;

    public UpdateServiceCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<UpdateServiceCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<UpdateServiceResult>> Handle(UpdateServiceCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<UpdateServiceResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<UpdateServiceResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var service = await _unitOfWork.Services.GetByIdAsync(command.ServiceId, cancellationToken);
        if (service == null)
            return Result<UpdateServiceResult>.Failure("Servicio no encontrado", "SERVICE_NOT_FOUND");

        if (service.FreelancerId != user.Freelancer.Id)
            return Result<UpdateServiceResult>.Failure("No tienes permisos para modificar este servicio", "FORBIDDEN");

        var hasChanges = false;

        if (!string.IsNullOrWhiteSpace(req.Title))
        {
            service.Title = req.Title.Trim();
            hasChanges = true;
        }
        if (!string.IsNullOrWhiteSpace(req.Description))
        {
            service.Description = req.Description.Trim();
            hasChanges = true;
        }
        if (req.Price.HasValue)
        {
            if (req.Price.Value <= 0)
                return Result<UpdateServiceResult>.Failure("El precio debe ser mayor a cero", "INVALID_PRICE");
            service.Price = req.Price.Value;
            hasChanges = true;
        }
        if (req.IsActive.HasValue)
        {
            service.IsActive = req.IsActive.Value;
            hasChanges = true;
        }

        if (hasChanges)
        {
            service.UpdatedAt = DateTime.UtcNow;
            await _unitOfWork.BeginTransactionAsync(cancellationToken);
            try
            {
                await _unitOfWork.Services.UpdateAsync(service, cancellationToken);
                await _unitOfWork.SaveChangesAsync(cancellationToken);
                await _unitOfWork.CommitTransactionAsync(cancellationToken);
            }
            catch (Exception ex)
            {
                await _unitOfWork.RollbackTransactionAsync(cancellationToken);
                _logger.LogError(ex, "Error al actualizar el servicio {Id}", command.ServiceId);
                return Result<UpdateServiceResult>.Failure("Error al actualizar el servicio", "UPDATE_SERVICE_ERROR");
            }
        }

        var dto = _mapper.Map<ServiceDto>(service);
        return Result<UpdateServiceResult>.Success(new UpdateServiceResult { Service = dto });
    }
}
