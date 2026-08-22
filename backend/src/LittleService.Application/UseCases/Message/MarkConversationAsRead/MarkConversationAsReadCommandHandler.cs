using LittleService.Application.Common;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Message.MarkConversationAsRead;

public class MarkConversationAsReadCommandHandler
    : IRequestHandler<MarkConversationAsReadCommand, Result<MarkConversationAsReadResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IChatAuthorizationService _chatAuthorizationService;
    private readonly IChatEventPublisher _chatEventPublisher;
    private readonly ILogger<MarkConversationAsReadCommandHandler> _logger;

    public MarkConversationAsReadCommandHandler(
        IUnitOfWork unitOfWork,
        IChatAuthorizationService chatAuthorizationService,
        IChatEventPublisher chatEventPublisher,
        ILogger<MarkConversationAsReadCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _chatAuthorizationService = chatAuthorizationService;
        _chatEventPublisher = chatEventPublisher;
        _logger = logger;
    }

    public async ValueTask<Result<MarkConversationAsReadResult>> Handle(
        MarkConversationAsReadCommand command,
        CancellationToken cancellationToken)
    {
        var access = await _chatAuthorizationService.EvaluateAccessAsync(
            command.UserId,
            command.ServiceRequestId,
            command.WithUserId,
            cancellationToken);

        if (!access.CanOpen)
            return Result<MarkConversationAsReadResult>.Failure(
                access.BlockedReason ?? "No tenés permisos para acceder a esta conversación",
                access.ErrorCode ?? "FORBIDDEN");

        var readAt = DateTime.UtcNow;

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        int markedCount;
        try
        {
            markedCount = await _unitOfWork.Messages.MarkConversationAsReadAsync(
                command.UserId,
                command.WithUserId,
                command.ServiceRequestId,
                cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al marcar conversación como leída {ServiceRequestId}", command.ServiceRequestId);
            return Result<MarkConversationAsReadResult>.Failure(
                "Error al marcar la conversación como leída",
                "MARK_CONVERSATION_READ_ERROR");
        }

        if (markedCount > 0)
        {
            await _chatEventPublisher.PublishMessagesReadAsync(
                command.ServiceRequestId,
                command.UserId,
                command.WithUserId,
                readAt,
                cancellationToken);
        }

        return Result<MarkConversationAsReadResult>.Success(new MarkConversationAsReadResult
        {
            MarkedCount = markedCount,
            ReadAt = readAt
        });
    }
}
