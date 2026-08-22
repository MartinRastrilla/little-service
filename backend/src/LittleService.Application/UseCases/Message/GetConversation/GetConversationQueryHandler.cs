using LittleService.Application.Common;
using LittleService.Application.DTOs.Messages;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Message.GetConversation;

public class GetConversationQueryHandler : IRequestHandler<GetConversationQuery, Result<GetConversationResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IChatAuthorizationService _chatAuthorizationService;
    private readonly ILogger<GetConversationQueryHandler> _logger;

    public GetConversationQueryHandler(
        IUnitOfWork unitOfWork,
        IChatAuthorizationService chatAuthorizationService,
        ILogger<GetConversationQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _chatAuthorizationService = chatAuthorizationService;
        _logger = logger;
    }

    public async ValueTask<Result<GetConversationResult>> Handle(
        GetConversationQuery query,
        CancellationToken cancellationToken)
    {
        var access = await _chatAuthorizationService.EvaluateAccessAsync(
            query.UserId,
            query.ServiceRequestId,
            query.WithUserId,
            cancellationToken);

        if (!access.CanOpen)
            return Result<GetConversationResult>.Failure(
                access.BlockedReason ?? "No tenés permisos para ver esta conversación",
                access.ErrorCode ?? "FORBIDDEN");

        var limit = query.Limit is > 0 and <= 100 ? query.Limit : 50;
        var page = await _unitOfWork.Messages.GetConversationPageAsync(
            query.ServiceRequestId,
            query.UserId,
            query.WithUserId,
            query.Cursor,
            limit,
            cancellationToken);

        return Result<GetConversationResult>.Success(new GetConversationResult
        {
            Messages = new PagedMessagesDto
            {
                Items = page.Items.Select(MessageMapper.ToDto).ToList(),
                NextCursor = page.NextCursor,
                HasMore = page.HasMore
            }
        });
    }
}
