using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;

namespace LittleService.Application.UseCases.Freelancer.UpdateFreelancer;

public class UpdateFreelancerCommandHandler
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly IFileStorageService _fileStorageService;

    public UpdateFreelancerCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, IFileStorageService fileStorageService)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _fileStorageService = fileStorageService;
    }

    public async Task<Result<UpdateFreelancerResult>> HandleAsync(UpdateFreelancerCommand command, CancellationToken cancellationToken = default)
    {
        //? 1. Verify user exists
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
        {
            return Result<UpdateFreelancerResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        }

        //? 2. Verify freelancer exists
        if (user.Freelancer == null)
        {
            return Result<UpdateFreelancerResult>.Failure("Freelancer no encontrado", "FREELANCER_NOT_FOUND");
        }

        //? 3. Save profile picture
        if (command.ProfilePicture != null && string.IsNullOrEmpty(command.ProfilePictureFileName))
        {
            //? 3.1 Delete old profile picture if exists
            if (!string.IsNullOrEmpty(user.ProfilePictureUrl) && !user.ProfilePictureUrl.Contains("default-profile-picture.png"))
            {
                var oldFilePath = user.ProfilePictureUrl.Replace(_fileStorageService.GetFileUrl(""), "");
                await _fileStorageService.DeleteFileAsync(oldFilePath, cancellationToken);
            }

            //? 3.2 Save new profile picture
            var extension = Path.GetExtension(command.ProfilePictureFileName);
            var baseFileName = $"{user.Id}_profile_picture";
            var fileNameWithExtension = $"{baseFileName}{extension}";

            //? 3.3 Save file
            var savedFilePath = await _fileStorageService.SaveFileAsync(
                command.ProfilePicture,
                fileNameWithExtension,
                "profiles",
                cancellationToken
            );

            //? 3.4 Update user profile picture url
            user.ProfilePictureUrl = _fileStorageService.GetFileUrl(savedFilePath);
        }

        //? 4. Update user
        var hasChanges = false;
        if (string.IsNullOrEmpty(command.Name) || command.Name != user.Name)
        {
            user.Name = command.Name ?? user.Name;
            hasChanges = true;
        }
        if (string.IsNullOrEmpty(command.Bio) || command.Bio != user.Freelancer.Bio)
        {
            user.Freelancer.Bio = command.Bio;
            hasChanges = true;
        }
        if (hasChanges)
        {
            user.UpdatedAt = DateTime.UtcNow;
            await _unitOfWork.Users.UpdateAsync(user, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
        }

        //? 5. Map to DTO
        var userDto = _mapper.Map<UserDto>(user);
        return Result<UpdateFreelancerResult>.Success(new UpdateFreelancerResult
        {
            User = userDto
        });
    }
}