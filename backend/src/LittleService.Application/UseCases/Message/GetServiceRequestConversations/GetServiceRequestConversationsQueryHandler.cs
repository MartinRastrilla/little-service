using LittleService.Application.Common;
using LittleService.Application.DTOs.Messages;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Message.GetServiceRequestConversations;

public class GetServiceRequestConversationsQueryHandler
    : IRequestHandler<GetServiceRequestConversationsQuery, Result<GetServiceRequestConversationsResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IChatAuthorizationService _chatAuthorizationService;
    private readonly ILogger<GetServiceRequestConversationsQueryHandler> _logger;

    public GetServiceRequestConversationsQueryHandler(
        IUnitOfWork unitOfWork,
        IChatAuthorizationService chatAuthorizationService,
        ILogger<GetServiceRequestConversationsQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _chatAuthorizationService = chatAuthorizationService;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceRequestConversationsResult>> Handle(
        GetServiceRequestConversationsQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetServiceRequestConversationsResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            query.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<GetServiceRequestConversationsResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        var isClient = user.Client != null && serviceRequest.ClientId == user.Client.Id;
        var isFreelancerParticipant = user.Freelancer != null &&
            (serviceRequest.FreelancerPickedId == user.Freelancer.Id ||
             serviceRequest.FreelancerApplications.Any(a => a.FreelancerId == user.Freelancer.Id));

        if (!isClient && !isFreelancerParticipant)
            return Result<GetServiceRequestConversationsResult>.Failure(
                "No tenés permisos para ver las conversaciones de este pedido",
                "FORBIDDEN");

        var existing = await _unitOfWork.Messages.GetInterlocutorsForServiceRequestAsync(
            query.ServiceRequestId,
            query.UserId,
            cancellationToken);

        var conversations = new Dictionary<Guid, ConversationSummaryDto>();
        foreach (var summary in existing)
        {
            var access = await _chatAuthorizationService.EvaluateAccessAsync(
                query.UserId,
                query.ServiceRequestId,
                summary.WithUserId,
                cancellationToken);

            conversations[summary.WithUserId] = MapSummary(summary, access);
        }

        if (isClient)
        {
            foreach (var application in serviceRequest.FreelancerApplications
                         .Where(a => a.Status != FreelancerApplicationStatus.Rejected))
            {
                var freelancerUserId = application.FreelancerId;
                if (conversations.ContainsKey(freelancerUserId))
                    continue;

                var access = await _chatAuthorizationService.EvaluateAccessAsync(
                    query.UserId,
                    query.ServiceRequestId,
                    freelancerUserId,
                    cancellationToken);

                if (!access.CanOpen)
                    continue;

                var freelancer = application.Freelancer;
                conversations[freelancerUserId] = new ConversationSummaryDto
                {
                    ServiceRequestId = query.ServiceRequestId,
                    WithUserId = freelancerUserId,
                    WithUserName = freelancer?.User?.Name ?? string.Empty,
                    WithUserProfilePictureUrl = freelancer?.User?.ProfilePictureUrl,
                    UnreadCount = 0,
                    CanSend = access.CanSend,
                    IsReadOnly = access.IsReadOnly,
                    WaitingForClientMessage = access.WaitingForClientMessage,
                    BlockedReason = access.BlockedReason
                };
            }

            if (serviceRequest.FreelancerPickedId.HasValue &&
                !conversations.ContainsKey(serviceRequest.FreelancerPickedId.Value))
            {
                var pickedId = serviceRequest.FreelancerPickedId.Value;
                var access = await _chatAuthorizationService.EvaluateAccessAsync(
                    query.UserId,
                    query.ServiceRequestId,
                    pickedId,
                    cancellationToken);

                if (access.CanOpen)
                {
                    var picked = serviceRequest.FreelancerPicked;
                    conversations[pickedId] = new ConversationSummaryDto
                    {
                        ServiceRequestId = query.ServiceRequestId,
                        WithUserId = pickedId,
                        WithUserName = picked?.User?.Name ?? string.Empty,
                        WithUserProfilePictureUrl = picked?.User?.ProfilePictureUrl,
                        UnreadCount = 0,
                        CanSend = access.CanSend,
                        IsReadOnly = access.IsReadOnly,
                        WaitingForClientMessage = access.WaitingForClientMessage,
                        BlockedReason = access.BlockedReason
                    };
                }
            }
        }
        else if (user.Freelancer != null)
        {
            var clientUserId = serviceRequest.ClientId;
            if (!conversations.ContainsKey(clientUserId))
            {
                var access = await _chatAuthorizationService.EvaluateAccessAsync(
                    query.UserId,
                    query.ServiceRequestId,
                    clientUserId,
                    cancellationToken);

                if (access.CanOpen)
                {
                    conversations[clientUserId] = new ConversationSummaryDto
                    {
                        ServiceRequestId = query.ServiceRequestId,
                        WithUserId = clientUserId,
                        WithUserName = serviceRequest.Client?.User?.Name ?? string.Empty,
                        WithUserProfilePictureUrl = serviceRequest.Client?.User?.ProfilePictureUrl,
                        UnreadCount = 0,
                        CanSend = access.CanSend,
                        IsReadOnly = access.IsReadOnly,
                        WaitingForClientMessage = access.WaitingForClientMessage,
                        BlockedReason = access.BlockedReason
                    };
                }
            }
        }

        return Result<GetServiceRequestConversationsResult>.Success(
            new GetServiceRequestConversationsResult
            {
                Conversations = conversations.Values
                    .OrderByDescending(c => c.LastMessageAt ?? DateTime.MinValue)
                    .ThenBy(c => c.WithUserName)
                    .ToList()
            });
    }

    private static ConversationSummaryDto MapSummary(
        Domain.Queries.ConversationSummaryReadModel summary,
        ChatAccessResult access) =>
        new()
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
        };
}
