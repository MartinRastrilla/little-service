using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Interfaces.Services;

public interface IChatAuthorizationService
{
    Task<ChatAccessResult> EvaluateAccessAsync(
        Guid currentUserId,
        Guid serviceRequestId,
        Guid withUserId,
        CancellationToken cancellationToken = default);

    bool CanOpenChatForServiceRequest(ServiceRequest serviceRequest);
}
