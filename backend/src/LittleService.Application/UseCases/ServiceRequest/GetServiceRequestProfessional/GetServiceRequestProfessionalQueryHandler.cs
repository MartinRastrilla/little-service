using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestProfessional;

public class GetServiceRequestProfessionalQueryHandler
    : IRequestHandler<GetServiceRequestProfessionalQuery, Result<GetServiceRequestProfessionalResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetServiceRequestProfessionalQueryHandler> _logger;

    public GetServiceRequestProfessionalQueryHandler(
        IUnitOfWork unitOfWork,
        ILogger<GetServiceRequestProfessionalQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceRequestProfessionalResult>> Handle(
        GetServiceRequestProfessionalQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetServiceRequestProfessionalResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetServiceRequestProfessionalResult>.Failure(
                "Perfil de cliente no encontrado",
                "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            query.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<GetServiceRequestProfessionalResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<GetServiceRequestProfessionalResult>.Failure(
                "No tienes permisos para ver esta solicitud",
                "FORBIDDEN");

        var dto = ServiceRequestProfessionalMapper.Map(serviceRequest);

        return Result<GetServiceRequestProfessionalResult>.Success(new GetServiceRequestProfessionalResult
        {
            Professional = dto
        });
    }
}
