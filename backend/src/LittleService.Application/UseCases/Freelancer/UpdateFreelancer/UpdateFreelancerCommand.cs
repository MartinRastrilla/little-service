using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Freelancer.UpdateFreelancer;

public class UpdateFreelancerCommand : IRequest<Result<UpdateFreelancerResult>>
{
    public Guid UserId { get; set; }
    public UpdateFreelancerRequest Request { get; set; } = null!;
}
