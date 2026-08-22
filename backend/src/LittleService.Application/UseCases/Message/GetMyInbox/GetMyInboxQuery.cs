using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Message.GetMyInbox;

public class GetMyInboxQuery : IRequest<Result<GetMyInboxResult>>
{
    public Guid UserId { get; set; }
}
