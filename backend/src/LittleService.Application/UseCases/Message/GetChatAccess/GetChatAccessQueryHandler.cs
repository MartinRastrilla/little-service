using LittleService.Application.Common;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using Mediator;

namespace LittleService.Application.UseCases.Message.GetChatAccess;

public class GetChatAccessQueryHandler : IRequestHandler<GetChatAccessQuery, Result<GetChatAccessResult>>
{
    private readonly IChatAuthorizationService _chatAuthorizationService;

    public GetChatAccessQueryHandler(IChatAuthorizationService chatAuthorizationService)
    {
        _chatAuthorizationService = chatAuthorizationService;
    }

    public async ValueTask<Result<GetChatAccessResult>> Handle(
        GetChatAccessQuery query,
        CancellationToken cancellationToken)
    {
        var access = await _chatAuthorizationService.EvaluateAccessAsync(
            query.UserId,
            query.ServiceRequestId,
            query.WithUserId,
            cancellationToken);

        if (access.ErrorCode == "SERVICE_REQUEST_NOT_FOUND")
            return Result<GetChatAccessResult>.Failure(access.BlockedReason!, access.ErrorCode);

        if (access.ErrorCode == "USER_NOT_FOUND")
            return Result<GetChatAccessResult>.Failure(access.BlockedReason!, access.ErrorCode);

        if (access.ErrorCode == "FORBIDDEN" || access.ErrorCode == "CHAT_NOT_ALLOWED")
            return Result<GetChatAccessResult>.Failure(access.BlockedReason!, access.ErrorCode);

        return Result<GetChatAccessResult>.Success(new GetChatAccessResult
        {
            Access = MessageMapper.ToDto(access)
        });
    }
}
