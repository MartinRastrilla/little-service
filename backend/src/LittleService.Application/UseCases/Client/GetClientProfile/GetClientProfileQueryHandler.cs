using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Client.GetClientProfile;

public class GetClientProfileQueryHandler : IRequestHandler<GetClientProfileQuery, Result<GetClientProfileResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<GetClientProfileQueryHandler> _logger;

    public GetClientProfileQueryHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<GetClientProfileQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<GetClientProfileResult>> Handle(GetClientProfileQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetClientProfileResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        if (user.Client == null)
            return Result<GetClientProfileResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var userDto = _mapper.Map<UserDto>(user);
        return Result<GetClientProfileResult>.Success(new GetClientProfileResult { User = userDto });
    }
}
