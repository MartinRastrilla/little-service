using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Contract.SignContract;

public class SignContractCommand : IRequest<Result<SignContractResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
