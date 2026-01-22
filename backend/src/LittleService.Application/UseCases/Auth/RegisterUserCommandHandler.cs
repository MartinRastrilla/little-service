using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Auth.RegisterUser;

public class RegisterUserCommandHandler
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ITokenGenerator _tokenGenerator;
    private readonly IMapper _mapper;
    private readonly ILogger<RegisterUserCommandHandler> _logger;

    public RegisterUserCommandHandler(IUnitOfWork unitOfWork, IPasswordHasher passwordHasher, ITokenGenerator tokenGenerator, IMapper mapper, ILogger<RegisterUserCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _tokenGenerator = tokenGenerator;
        _mapper = mapper;
        _logger = logger;
    }

    public async Task<Result<RegisterUserResult>> HandleAsync(RegisterUserCommand command, CancellationToken cancellationToken = default)
    {
        try
        {
            //? 1. Validate that passwords match
            if (command.Password != command.ConfirmPassword)
            {
                return Result<RegisterUserResult>.Failure(
                    "Las contraseñas no coinciden",
                    "PASSWORDS_DONT_MATCH");
            }

            //? 2. Validate password strength
            var passwordValidation = ValidatePasswordStrength(command.Password);
            if (!passwordValidation.IsSuccess)
            {
                return Result<RegisterUserResult>.Failure(
                    passwordValidation.Error!,
                    passwordValidation.ErrorCode);
            }

            //? 3. Validate that user does not exist
            var existingUser = await _unitOfWork.Users.GetByEmailAsync(command.Email, cancellationToken);
            if (existingUser != null)
            {
                return Result<RegisterUserResult>.Failure(
                    "El usuario ya existe",
                    "USER_ALREADY_EXISTS");
            }

            //? 4. Validate and get roles
            var rolesResult = await ValidateAndGetRolesAsync(command.Roles, cancellationToken);
            if (!rolesResult.IsSuccess)
            {
                return Result<RegisterUserResult>.Failure(
                    rolesResult.Error!,
                    rolesResult.ErrorCode);
            }
            var roles = rolesResult.Value!.ToList();

            //? 5. Create user
            var hashedPassword = _passwordHasher.HashPassword(command.Password);
            var newUser = User.Create(
                command.Name,
                command.Email,
                hashedPassword,
                User.DEFAULT_PROFILE_PICTURE_URL
            );

            //? 6. Add roles to user
            foreach (var role in roles)
            {
                newUser.AddRole(role);
            }

            //? 7. Create freelancer or client profile based on role
            var roleNames = roles.Select(r => r.Name).ToList();
            if (roleNames.Contains("Freelancer", StringComparer.OrdinalIgnoreCase))
            {
                var freelancer = LittleService.Domain.Entities.Freelancer.Create(newUser.Id);
                newUser.SetFreelancerProfile(freelancer);
            }

            if (roleNames.Contains("Client", StringComparer.OrdinalIgnoreCase))
            {
                var client = LittleService.Domain.Entities.Client.Create(newUser.Id);
                newUser.SetClientProfile(client);
            }

            //? 8. Save user with transaction
            await _unitOfWork.BeginTransactionAsync(cancellationToken);
            try
            {
                await _unitOfWork.Users.AddAsync(newUser, cancellationToken);
                await _unitOfWork.SaveChangesAsync(cancellationToken);
                await _unitOfWork.CommitTransactionAsync(cancellationToken);
            }
            catch
            {
                await _unitOfWork.RollbackTransactionAsync(cancellationToken);
                throw;
            }

            //? 9. Generate JWT token
            var token = _tokenGenerator.GenerateToken(newUser);
            var expiresAt = _tokenGenerator.GetTokenExpirationDate(token);

            //? 10. Map to DTO
            var userDto = _mapper.Map<UserDto>(newUser);

            //? 11. Return success result
            return Result<RegisterUserResult>.Success(new RegisterUserResult
            {
                Token = token,
                ExpiresAt = expiresAt,
                User = userDto
            });
        }
        catch (DomainException ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al registrar el usuario");
            return Result<RegisterUserResult>.Failure(ex.Message, ex.ErrorCode);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error al registrar el usuario");
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            return Result<RegisterUserResult>.Failure("Ocurrió un error al registrar el usuario", "REGISTRATION_ERROR");
        }
    }

    private static Result ValidatePasswordStrength(string password)
    {
        if (string.IsNullOrWhiteSpace(password))
            return Result.Failure("La contraseña no puede estar vacía", "PASSWORD_EMPTY");

        if (password.Length < 8)
            return Result.Failure("La contraseña debe tener al menos 8 caracteres", "PASSWORD_TOO_SHORT");

        if (password.Length > 28)
            return Result.Failure("La contraseña no puede tener más de 28 caracteres", "PASSWORD_TOO_LONG");

        if (!password.Any(char.IsUpper))
            return Result.Failure("La contraseña debe contener al menos una letra mayúscula", "PASSWORD_NO_UPPERCASE");

        if (!password.Any(char.IsLower))
            return Result.Failure("La contraseña debe contener al menos una letra minúscula", "PASSWORD_NO_LOWERCASE");

        if (!password.Any(char.IsDigit))
            return Result.Failure("La contraseña debe contener al menos un número", "PASSWORD_NO_DIGIT");

        return Result.Success();
    }

    private async Task<Result<IEnumerable<Role>>> ValidateAndGetRolesAsync(
        IEnumerable<string> roleNames,
        CancellationToken cancellationToken = default)
    {
        var rolesList = roleNames
            .Select(r => r.Trim())
            .Where(r => !string.IsNullOrWhiteSpace(r))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        if (rolesList.Count == 0)
        {
            return Result<IEnumerable<Role>>.Failure(
                "Debe especificar al menos un rol",
                "NO_ROLES_SPECIFIED");
        }

        var validRoles = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            "Freelancer", "Client"
        };

        if (rolesList.Any(r => !validRoles.Contains(r)))
        {
            return Result<IEnumerable<Role>>.Failure(
                "Los roles no son válidos",
                "INVALID_ROLES");
        }

        var roles = await _unitOfWork.Roles.GetByNamesAsync(rolesList, cancellationToken);
        var rolesArray = roles.ToArray();

        foreach (var roleName in rolesList)
        {
            if (!rolesArray.Any(r => r.Name.Equals(roleName, StringComparison.OrdinalIgnoreCase)))
            {
                return Result<IEnumerable<Role>>.Failure(
                    "Los roles especificados no existen",
                    "ROLES_NOT_FOUND");
            }
        }

        return Result<IEnumerable<Role>>.Success(rolesArray);
    }
}