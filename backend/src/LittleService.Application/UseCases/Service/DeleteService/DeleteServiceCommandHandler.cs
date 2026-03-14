using LittleService.Application.Common;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.DeleteService;

public class DeleteServiceCommandHandler : IRequestHandler<DeleteServiceCommand, Result<DeleteServiceResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<DeleteServiceCommandHandler> _logger;

    public DeleteServiceCommandHandler(IUnitOfWork unitOfWork, ILogger<DeleteServiceCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<DeleteServiceResult>> Handle(DeleteServiceCommand command, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<DeleteServiceResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<DeleteServiceResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var service = await _unitOfWork.Services.GetByIdAsync(command.ServiceId, cancellationToken);
        if (service == null)
            return Result<DeleteServiceResult>.Failure("Servicio no encontrado", "SERVICE_NOT_FOUND");

        if (service.FreelancerId != user.Freelancer.Id)
            return Result<DeleteServiceResult>.Failure("No tienes permisos para eliminar este servicio", "FORBIDDEN");

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Services.DeleteAsync(command.ServiceId, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al eliminar el servicio {Id}", command.ServiceId);
            return Result<DeleteServiceResult>.Failure("Error al eliminar el servicio", "DELETE_SERVICE_ERROR");
        }

        _logger.LogInformation("Servicio {Id} eliminado por freelancer {FreelancerId}", command.ServiceId, user.Freelancer.Id);
        return Result<DeleteServiceResult>.Success(new DeleteServiceResult { ServiceId = command.ServiceId });
    }
}
