using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Freelancer.GetMyApplications;

public class GetMyApplicationsQuery : IRequest<Result<GetMyApplicationsResult>>
{
    public Guid UserId { get; set; }
}
