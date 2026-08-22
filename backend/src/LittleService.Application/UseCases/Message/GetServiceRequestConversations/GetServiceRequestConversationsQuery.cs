using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Message.GetServiceRequestConversations;

public class GetServiceRequestConversationsQuery : IRequest<Result<GetServiceRequestConversationsResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
}
