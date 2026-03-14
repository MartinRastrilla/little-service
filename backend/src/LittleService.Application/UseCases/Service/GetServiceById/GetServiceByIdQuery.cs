using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.Service.GetServiceById;

public class GetServiceByIdQuery : IRequest<Result<GetServiceByIdResult>>
{
    public Guid ServiceId { get; set; }
}
