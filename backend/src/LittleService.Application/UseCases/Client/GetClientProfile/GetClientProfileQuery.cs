using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Client.GetClientProfile;

public class GetClientProfileQuery : IRequest<Result<GetClientProfileResult>>
{
    public Guid UserId { get; set; }
}
