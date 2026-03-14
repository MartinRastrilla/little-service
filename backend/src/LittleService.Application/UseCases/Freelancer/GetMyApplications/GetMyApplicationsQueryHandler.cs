using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.GetMyApplications;

public class GetMyApplicationsQueryHandler : IRequestHandler<GetMyApplicationsQuery, Result<GetMyApplicationsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetMyApplicationsQueryHandler> _logger;

    public GetMyApplicationsQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetMyApplicationsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyApplicationsResult>> Handle(GetMyApplicationsQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyApplicationsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetMyApplicationsResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var applications = await _unitOfWork.FreelancerApplications.GetByFreelancerIdAsync(user.Freelancer.Id, cancellationToken);
        var dtos = _mapper.Map<IList<FreelancerApplicationSummaryDto>>(applications);

        return Result<GetMyApplicationsResult>.Success(new GetMyApplicationsResult { Applications = dtos });
    }
}
