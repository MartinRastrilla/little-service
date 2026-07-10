using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Freelancer.GetFreelancerProfile;

public class GetFreelancerProfileQueryHandler : IRequestHandler<GetFreelancerProfileQuery, Result<GetFreelancerProfileResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly ILogger<GetFreelancerProfileQueryHandler> _logger;

    public GetFreelancerProfileQueryHandler(IUnitOfWork unitOfWork, ILogger<GetFreelancerProfileQueryHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _logger = logger;
    }

    public async ValueTask<Result<GetFreelancerProfileResult>> Handle(GetFreelancerProfileQuery query, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetFreelancerProfileResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<GetFreelancerProfileResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

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
        return Result<GetFreelancerProfileResult>.Success(new GetFreelancerProfileResult { User = userDto });
    }
}
