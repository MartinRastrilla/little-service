using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Contract.GetContract;

public class GetContractQuery : IRequest<Result<GetContractResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
