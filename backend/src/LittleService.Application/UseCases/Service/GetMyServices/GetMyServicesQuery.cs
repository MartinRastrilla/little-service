using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Service.GetMyServices;

public class GetMyServicesQuery : IRequest<Result<GetMyServicesResult>>
{
    public Guid UserId { get; set; }
}
