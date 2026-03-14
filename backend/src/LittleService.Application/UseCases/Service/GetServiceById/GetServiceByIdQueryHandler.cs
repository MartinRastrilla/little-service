using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.GetServiceById;

public class GetServiceByIdQueryHandler : IRequestHandler<GetServiceByIdQuery, Result<GetServiceByIdResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetServiceByIdQueryHandler> _logger;

    public GetServiceByIdQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetServiceByIdQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetServiceByIdResult>> Handle(GetServiceByIdQuery query, CancellationToken cancellationToken)
    {
        var service = await _unitOfWork.Services.GetByIdAsync(query.ServiceId, cancellationToken);
        if (service == null)
            return Result<GetServiceByIdResult>.Failure("Servicio no encontrado", "SERVICE_NOT_FOUND");

        var dto = _mapper.Map<ServiceDto>(service);
        return Result<GetServiceByIdResult>.Success(new GetServiceByIdResult { Service = dto });
    }
}
