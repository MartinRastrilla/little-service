using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Client.GetPublicClientProfile;

public class GetPublicClientProfileQuery : IRequest<Result<GetPublicClientProfileResult>>
{
    public Guid ViewerUserId { get; set; }
    public Guid ClientId { get; set; }
}
