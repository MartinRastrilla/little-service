using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.GetMyServices;

public class GetMyServicesQueryHandler : IRequestHandler<GetMyServicesQuery, Result<GetMyServicesResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetMyServicesQueryHandler> _logger;

    public GetMyServicesQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetMyServicesQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyServicesResult>> Handle(GetMyServicesQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyServicesResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetMyServicesResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var services = await _unitOfWork.Services.GetByFreelancerIdAsync(user.Freelancer.Id, cancellationToken);
        var dtos = _mapper.Map<IList<ServiceDto>>(services);

        return Result<GetMyServicesResult>.Success(new GetMyServicesResult { Services = dtos });
    }
}
