using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetApplicationsByServiceRequest;

public class GetApplicationsByServiceRequestQueryHandler : IRequestHandler<GetApplicationsByServiceRequestQuery, Result<GetApplicationsByServiceRequestResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetApplicationsByServiceRequestQueryHandler> _logger;

    public GetApplicationsByServiceRequestQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetApplicationsByServiceRequestQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetApplicationsByServiceRequestResult>> Handle(GetApplicationsByServiceRequestQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetApplicationsByServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetApplicationsByServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(query.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<GetApplicationsByServiceRequestResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        if (serviceRequest.ClientId != user.Client.Id)
            return Result<GetApplicationsByServiceRequestResult>.Failure("No tienes permisos para ver estas aplicaciones", "FORBIDDEN");

        var dtos = _mapper.Map<IList<FreelancerApplicationSummaryDto>>(serviceRequest.FreelancerApplications);
        return Result<GetApplicationsByServiceRequestResult>.Success(new GetApplicationsByServiceRequestResult { Applications = dtos });
    }
}
