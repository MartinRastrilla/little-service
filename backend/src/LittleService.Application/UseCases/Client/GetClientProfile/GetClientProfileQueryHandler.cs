using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Client.GetClientProfile;

public class GetClientProfileQueryHandler : IRequestHandler<GetClientProfileQuery, Result<GetClientProfileResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetClientProfileQueryHandler> _logger;

    public GetClientProfileQueryHandler(IUnitOfWork unitOfWork, ILogger<GetClientProfileQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetClientProfileResult>> Handle(GetClientProfileQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetClientProfileResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        if (user.Client == null)
            return Result<GetClientProfileResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        var userDto = new UserDto
        {
            Id = user.Id,
            Name = user.Name,
            Email = user.Email,
            ProfilePictureUrl = user.ProfilePictureUrl,
            CreatedAt = user.CreatedAt,
            UpdatedAt = user.UpdatedAt ?? user.CreatedAt,
            Roles = user.UserRoles.Select(ur => new RoleDto
            {
                Id = ur.Role.Id,
                Name = ur.Role.Name,
                Description = ur.Role.Description
            }).ToList(),
            Freelancer = user.Freelancer is null ? null : new FreelancerDto
            {
                UserId = user.Freelancer.Id,
                Bio = user.Freelancer.Bio,
                Profession = user.Freelancer.Profession,
                RatingAverage = user.Freelancer.RatingAverage,
                RatingCount = user.Freelancer.RatingCount,
                CompletedJobs = user.Freelancer.CompletedJobs
            },
            Client = user.Client is null ? null : new ClientDto
            {
                UserId = user.Client.Id,
                Address = user.Client.Address,
                TotalContracts = user.Client.TotalContracts
            }
        };
        return Result<GetClientProfileResult>.Success(new GetClientProfileResult { User = userDto });
    }
}
