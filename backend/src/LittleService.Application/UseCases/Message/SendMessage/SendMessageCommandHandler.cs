using LittleService.Application.Common;
using LittleService.Application.DTOs.Messages;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Entities;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Message.SendMessage;

public class SendMessageCommandHandler : IRequestHandler<SendMessageCommand, Result<SendMessageResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IChatAuthorizationService _chatAuthorizationService;
    private readonly IChatEventPublisher _chatEventPublisher;
    private readonly ILogger<SendMessageCommandHandler> _logger;

    public SendMessageCommandHandler(
        IUnitOfWork unitOfWork,
        IChatAuthorizationService chatAuthorizationService,
        IChatEventPublisher chatEventPublisher,
        ILogger<SendMessageCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _chatAuthorizationService = chatAuthorizationService;
        _chatEventPublisher = chatEventPublisher;
        _logger = logger;
    }

    public async ValueTask<Result<SendMessageResult>> Handle(
        SendMessageCommand command,
        CancellationToken cancellationToken)
    {
        var access = await _chatAuthorizationService.EvaluateAccessAsync(
            command.UserId,
            command.ServiceRequestId,
            command.ToUserId,
            cancellationToken);

        if (!access.CanOpen)
            return Result<SendMessageResult>.Failure(
                access.BlockedReason ?? "No tenés permisos para enviar mensajes",
                access.ErrorCode ?? "FORBIDDEN");

        if (!access.CanSend)
        {
            return Result<SendMessageResult>.Failure(
                access.BlockedReason ?? "No podés enviar mensajes en este momento",
                access.ErrorCode ?? "CHAT_NOT_ALLOWED");
        }

        Domain.Entities.Message message;
        try
        {
            message = Domain.Entities.Message.Create(
                command.UserId,
                command.ToUserId,
                command.ServiceRequestId,
                command.Content);
        }
        catch (DomainException ex)
        {
            return Result<SendMessageResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Messages.AddAsync(message, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al enviar mensaje en ServiceRequest {ServiceRequestId}", command.ServiceRequestId);
            return Result<SendMessageResult>.Failure("Error al enviar el mensaje", "SEND_MESSAGE_ERROR");
        }

        var dto = MessageMapper.ToDto(message);
        await _chatEventPublisher.PublishMessageReceivedAsync(dto, cancellationToken);

        return Result<SendMessageResult>.Success(new SendMessageResult { Message = dto });
    }
}
