using LittleService.Application.Common;
using LittleService.Application.DTOs.Messages;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Message.GetMyInbox;

public class GetMyInboxQueryHandler : IRequestHandler<GetMyInboxQuery, Result<GetMyInboxResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IChatAuthorizationService _chatAuthorizationService;
    private readonly ILogger<GetMyInboxQueryHandler> _logger;

    public GetMyInboxQueryHandler(
        IUnitOfWork unitOfWork,
        IChatAuthorizationService chatAuthorizationService,
        ILogger<GetMyInboxQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _chatAuthorizationService = chatAuthorizationService;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyInboxResult>> Handle(
        GetMyInboxQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyInboxResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        var inboxGroups = await _unitOfWork.Messages.GetInboxForUserAsync(query.UserId, cancellationToken);
        var result = new List<InboxServiceRequestGroupDto>();

        foreach (var group in inboxGroups)
        {
            var conversations = new List<ConversationSummaryDto>();
            foreach (var summary in group.Conversations)
            {
                var access = await _chatAuthorizationService.EvaluateAccessAsync(
                    query.UserId,
                    group.ServiceRequestId,
                    summary.WithUserId,
                    cancellationToken);

                conversations.Add(new ConversationSummaryDto
                {
                    ServiceRequestId = summary.ServiceRequestId,
                    WithUserId = summary.WithUserId,
                    WithUserName = summary.WithUserName,
                    WithUserProfilePictureUrl = summary.WithUserProfilePicture,
                    LastMessageContent = summary.LastMessageContent,
                    LastMessageAt = summary.LastMessageAt,
                    UnreadCount = summary.UnreadCount,
                    CanSend = access.CanSend,
                    IsReadOnly = access.IsReadOnly,
                    WaitingForClientMessage = access.WaitingForClientMessage,
                    BlockedReason = access.BlockedReason
                });
            }

            result.Add(new InboxServiceRequestGroupDto
            {
                ServiceRequestId = group.ServiceRequestId,
                Title = group.Title,
                Status = group.Status.ToString(),
                Conversations = conversations
            });
        }

        return Result<GetMyInboxResult>.Success(new GetMyInboxResult { Inbox = result });
    }
}
