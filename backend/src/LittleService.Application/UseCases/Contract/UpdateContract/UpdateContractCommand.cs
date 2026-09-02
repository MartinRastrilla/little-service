using LittleService.Application.Common;
using LittleService.Application.DTOs.Contracts;
using Mediator;

namespace LittleService.Application.UseCases.Contract.UpdateContract;

public class UpdateContractCommand : IRequest<Result<UpdateContractResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public UpsertContractRequest Request { get; set; } = null!;
}
