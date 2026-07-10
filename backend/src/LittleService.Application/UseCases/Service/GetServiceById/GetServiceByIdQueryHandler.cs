using LittleService.Application.Common;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.GetServiceById;

public class GetServiceByIdQueryHandler : IRequestHandler<GetServiceByIdQuery, Result<GetServiceByIdResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetServiceByIdQueryHandler> _logger;

    public GetServiceByIdQueryHandler(IUnitOfWork unitOfWork, ILogger<GetServiceByIdQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceByIdResult>> Handle(GetServiceByIdQuery query, CancellationToken cancellationToken)
    {
        var service = await _unitOfWork.Services.GetByIdAsync(query.ServiceId, cancellationToken);
        if (service == null)
            return Result<GetServiceByIdResult>.Failure("Servicio no encontrado", "SERVICE_NOT_FOUND");

        var dto = new ServiceDto
        {
            Id = service.Id,
            FreelancerId = service.FreelancerId,
            Title = service.Title,
            Description = service.Description,
            Price = service.Price,
            IsActive = service.IsActive,
            CreatedAt = service.CreatedAt
        };
        return Result<GetServiceByIdResult>.Success(new GetServiceByIdResult { Service = dto });
    }
}
