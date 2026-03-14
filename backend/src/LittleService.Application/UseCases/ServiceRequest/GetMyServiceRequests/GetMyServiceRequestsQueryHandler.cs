using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;

public class GetMyServiceRequestsQueryHandler : IRequestHandler<GetMyServiceRequestsQuery, Result<GetMyServiceRequestsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetMyServiceRequestsQueryHandler> _logger;

    public GetMyServiceRequestsQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetMyServiceRequestsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyServiceRequestsResult>> Handle(GetMyServiceRequestsQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyServiceRequestsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<GetMyServiceRequestsResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var serviceRequests = await _unitOfWork.ServiceRequests.GetByClientIdAsync(user.Client.Id, cancellationToken);
        var dtos = _mapper.Map<IList<ServiceRequestSummaryDto>>(serviceRequests);

        return Result<GetMyServiceRequestsResult>.Success(new GetMyServiceRequestsResult { ServiceRequests = dtos });
    }
}
