using LittleService.Application.Common;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.GetMyServices;

public class GetMyServicesQueryHandler : IRequestHandler<GetMyServicesQuery, Result<GetMyServicesResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetMyServicesQueryHandler> _logger;

    public GetMyServicesQueryHandler(IUnitOfWork unitOfWork, ILogger<GetMyServicesQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetMyServicesResult>> Handle(GetMyServicesQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetMyServicesResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetMyServicesResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var summaries = await _unitOfWork.Services.GetSummariesByFreelancerIdAsync(user.Freelancer.Id, cancellationToken);
        var dtos = summaries.Select(s => new ServiceDto
        {
            Id = s.Id,
            FreelancerId = s.FreelancerId,
            Title = s.Title,
            Description = s.Description,
            Price = s.Price,
            IsActive = s.IsActive,
            CreatedAt = s.CreatedAt
        }).ToList();

        return Result<GetMyServicesResult>.Success(new GetMyServicesResult { Services = dtos });
    }
}
