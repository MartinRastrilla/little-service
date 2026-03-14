using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerProfile;

public class GetFreelancerProfileQueryHandler : IRequestHandler<GetFreelancerProfileQuery, Result<GetFreelancerProfileResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetFreelancerProfileQueryHandler> _logger;

    public GetFreelancerProfileQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetFreelancerProfileQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetFreelancerProfileResult>> Handle(GetFreelancerProfileQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetFreelancerProfileResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetFreelancerProfileResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var userDto = _mapper.Map<UserDto>(user);
        return Result<GetFreelancerProfileResult>.Success(new GetFreelancerProfileResult { User = userDto });
    }
}
