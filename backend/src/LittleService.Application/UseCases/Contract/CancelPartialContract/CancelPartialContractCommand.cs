using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Contract.CancelPartialContract;

public class CancelPartialContractCommand : IRequest<Result<CancelPartialContractResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
