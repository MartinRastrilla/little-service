using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;

namespace LittleService.Application.Services;

public class ChatAuthorizationService : IChatAuthorizationService
{
    private readonly IUnitOfWork _unitOfWork;

    public ChatAuthorizationService(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ChatAccessResult> EvaluateAccessAsync(
        Guid currentUserId,
        Guid serviceRequestId,
        Guid withUserId,
        CancellationToken cancellationToken = default)
    {
        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            serviceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return ChatAccessResult.Denied("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        var user = await _unitOfWork.Users.GetByIdAsync(currentUserId, cancellationToken);
        if (user == null)
            return ChatAccessResult.Denied("Usuario no encontrado", "USER_NOT_FOUND");

        var isServiceRequestReadOnly = IsServiceRequestReadOnly(serviceRequest);

        if (user.Client != null && serviceRequest.ClientId == user.Client.Id)
            return await EvaluateClientAccessAsync(
                user,
                serviceRequest,
                withUserId,
                isServiceRequestReadOnly,
                cancellationToken).ConfigureAwait(false);

        if (user.Freelancer != null)
            return await EvaluateFreelancerAccessAsync(
                user,
                serviceRequest,
                withUserId,
                isServiceRequestReadOnly,
                cancellationToken);

        return ChatAccessResult.Denied("No tenés permisos para acceder a este chat", "FORBIDDEN");
    }

    public bool CanOpenChatForServiceRequest(ServiceRequest serviceRequest)
    {
        if (IsServiceRequestReadOnly(serviceRequest))
            return false;

        if (serviceRequest.FreelancerPickedId.HasValue)
            return true;

        return serviceRequest.FreelancerApplications.Any(a => a.Status == FreelancerApplicationStatus.Pending);
    }

    private Task<ChatAccessResult> EvaluateClientAccessAsync(
        User clientUser,
        ServiceRequest serviceRequest,
        Guid withUserId,
        bool isServiceRequestReadOnly,
        CancellationToken cancellationToken)
    {
        _ = cancellationToken;
        if (withUserId == clientUser.Id)
            return Task.FromResult(ChatAccessResult.Denied("Interlocutor no válido", "CHAT_NOT_ALLOWED"));

        var application = serviceRequest.FreelancerApplications
            .FirstOrDefault(a => a.FreelancerId == withUserId);

        var isAssignedProfessional = serviceRequest.FreelancerPickedId == withUserId;

        if (application == null && !isAssignedProfessional)
            return Task.FromResult(ChatAccessResult.Denied("Interlocutor no válido para este pedido", "CHAT_NOT_ALLOWED"));

        if (application?.Status == FreelancerApplicationStatus.Rejected)
        {
            return Task.FromResult(ChatAccessResult.Allowed(
                canSend: false,
                isReadOnly: true,
                waitingForClientMessage: false,
                blockedReason: "La postulación fue rechazada. Solo podés leer el historial.",
                errorCode: "APPLICATION_REJECTED_READ_ONLY"));
        }

        if (isServiceRequestReadOnly)
        {
            return Task.FromResult(ChatAccessResult.Allowed(
                canSend: false,
                isReadOnly: true,
                waitingForClientMessage: false,
                blockedReason: "El pedido está cerrado o cancelado. Solo podés leer el historial.",
                errorCode: "SERVICE_REQUEST_READ_ONLY"));
        }

        return Task.FromResult(ChatAccessResult.Allowed(
            canSend: true,
            isReadOnly: false,
            waitingForClientMessage: false));
    }

    private async Task<ChatAccessResult> EvaluateFreelancerAccessAsync(
        User freelancerUser,
        ServiceRequest serviceRequest,
        Guid withUserId,
        bool isServiceRequestReadOnly,
        CancellationToken cancellationToken)
    {
        var clientUserId = serviceRequest.ClientId;
        if (withUserId != clientUserId)
            return ChatAccessResult.Denied("Interlocutor no válido para este pedido", "CHAT_NOT_ALLOWED");

        var application = serviceRequest.FreelancerApplications
            .FirstOrDefault(a => a.FreelancerId == freelancerUser.Freelancer!.Id);

        var isAssigned = serviceRequest.FreelancerPickedId == freelancerUser.Freelancer!.Id;

        if (application == null && !isAssigned)
            return ChatAccessResult.Denied("No tenés permisos para acceder a este chat", "FORBIDDEN");

        if (application?.Status == FreelancerApplicationStatus.Rejected)
        {
            return ChatAccessResult.Allowed(
                canSend: false,
                isReadOnly: true,
                waitingForClientMessage: false,
                blockedReason: "Tu postulación fue rechazada. Solo podés leer el historial.",
                errorCode: "APPLICATION_REJECTED_READ_ONLY");
        }

        if (isServiceRequestReadOnly)
        {
            return ChatAccessResult.Allowed(
                canSend: false,
                isReadOnly: true,
                waitingForClientMessage: false,
                blockedReason: "El pedido está cerrado o cancelado. Solo podés leer el historial.",
                errorCode: "SERVICE_REQUEST_READ_ONLY");
        }

        var clientInitiated = await _unitOfWork.Messages.HasClientInitiatedThreadAsync(
            serviceRequest.Id,
            clientUserId,
            freelancerUser.Id,
            cancellationToken);

        if (!clientInitiated)
        {
            return ChatAccessResult.Allowed(
                canSend: false,
                isReadOnly: false,
                waitingForClientMessage: true,
                blockedReason: "Debés recibir un mensaje del cliente antes de poder responder.",
                errorCode: "WAITING_FOR_CLIENT_MESSAGE");
        }

        return ChatAccessResult.Allowed(
            canSend: true,
            isReadOnly: false,
            waitingForClientMessage: false);
    }

    private static bool IsServiceRequestReadOnly(ServiceRequest serviceRequest) =>
        serviceRequest.Status is ServiceRequestStatus.Cancelled;
}
