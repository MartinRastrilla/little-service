using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;

namespace LittleService.Application.UseCases.Auth.RegisterUser;

public class RegisterUserCommandHandler
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ITokenGenerator _tokenGenerator;
    private readonly IMapper _mapper;

    public RegisterUserCommandHandler(IUnitOfWork unitOfWork, IPasswordHasher passwordHasher, ITokenGenerator tokenGenerator, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _tokenGenerator = tokenGenerator;
        _mapper = mapper;
    }

    public async Task<Result<RegisterUserResult>> HandleAsync(RegisterUserCommand command, CancellationToken cancellationToken = default)
    {
        //? 1. Validar que las contraseñas coincidan
        if (command.Password != command.ConfirmPassword)
        {
            return Result<RegisterUserResult>.Failure(
                "Las contraseñas no coinciden",
                "PASSWORDS_DONT_MATCH");
        }

        //? 2. Validar fortaleza de la contraseña
        var passwordValidation = ValidatePasswordStrength(command.Password);
        if (!passwordValidation.IsSuccess)
        {
            return Result<RegisterUserResult>.Failure(
                passwordValidation.Error!,
                passwordValidation.ErrorCode);
        }

        //? 3. Validar que el usuario ya exista
        var existingUser = await _unitOfWork.Users.GetByEmailAsync(command.Email, cancellationToken);
        if (existingUser != null)
        {
            return Result<RegisterUserResult>.Failure(
                "El usuario ya existe",
                "USER_ALREADY_EXISTS");
        }

        //? 4. Validar y obtener roles
        var rolesResult = await ValidateAndGetRolesAsync(command.Roles, cancellationToken);

        if (!rolesResult.IsSuccess)
        {
            return Result<RegisterUserResult>.Failure(
                rolesResult.Error!,
                rolesResult.ErrorCode);
        }

        var roles = rolesResult.Value!.ToList();

        //? 5. Crear usuario
        var newUser = new User
        {
            Id = Guid.NewGuid(),
            Name = command.Name,
            Email = command.Email,
            Password = _passwordHasher.HashPassword(command.Password),
            ProfilePictureUrl = "/images/default-profile-picture.png", // ! Hardcoded from /images/default-profile-picture.png
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow,
            UserRoles = roles.Select(role => new UserRole
            {
                RoleId = role.Id,
                Role = role,
            }).ToList()
        };

        //? 6. Agregar Freelancer o Client si es necesario
        var roleNames = roles.Select(r => r.Name).ToList();
        if (roleNames.Contains("Freelancer", StringComparer.OrdinalIgnoreCase))
        {
            newUser.Freelancer = new Freelancer
            {
                UserId = newUser.Id,
                Bio = null,
                RatingAverage = 0,
                RatingCount = 0,
                CompletedJobs = 0,
                Services = new List<Service>()
            };
        }

        if (roleNames.Contains("Client", StringComparer.OrdinalIgnoreCase))
        {
            newUser.Client = new Client
            {
                UserId = newUser.Id,
                TotalContracts = 0
            };
        }

        //? 7. Guardar cambios con transacción
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

        //? 8. Generar token
        var token = _tokenGenerator.GenerateToken(newUser);
        var expiresAt = _tokenGenerator.GetTokenExpirationDate(token);

        //? 9. Mapear a DTO
        var userDto = _mapper.Map<UserDto>(newUser);

        //? 10. Retornar resultado
        var result = new RegisterUserResult
        {
            Token = token,
            ExpiresAt = expiresAt,
            User = userDto
        };

        return Result<RegisterUserResult>.Success(result);
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