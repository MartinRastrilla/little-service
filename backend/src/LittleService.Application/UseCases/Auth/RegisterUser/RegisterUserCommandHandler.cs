using LittleService.Application.Common;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Auth.RegisterUser;

public class RegisterUserCommandHandler : IRequestHandler<RegisterUserCommand, Result<RegisterUserResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly IAuthTokenIssuer _authTokenIssuer;
    private readonly ILogger<RegisterUserCommandHandler> _logger;

    public RegisterUserCommandHandler(IUnitOfWork unitOfWork, IPasswordHasher passwordHasher, IAuthTokenIssuer authTokenIssuer, ILogger<RegisterUserCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _authTokenIssuer = authTokenIssuer;
        _logger = logger;
    }

    public async ValueTask<Result<RegisterUserResult>> Handle(RegisterUserCommand command, CancellationToken cancellationToken)
    {
        try
        {
            var req = command.Request;
            if (req.Password != req.ConfirmPassword)
            {
                return Result<RegisterUserResult>.Failure("Las contraseñas no coinciden", "PASSWORDS_DONT_MATCH");
            }

            var passwordValidation = ValidatePasswordStrength(req.Password);
            if (!passwordValidation.IsSuccess)
            {
                return Result<RegisterUserResult>.Failure(passwordValidation.Error!, passwordValidation.ErrorCode);
            }

            var existingUser = await _unitOfWork.Users.GetByEmailAsync(req.Email, cancellationToken);
            if (existingUser != null)
            {
                return Result<RegisterUserResult>.Failure("El usuario ya existe", "USER_ALREADY_EXISTS");
            }

            var rolesResult = await ValidateAndGetRolesAsync(req.Roles, cancellationToken);
            if (!rolesResult.IsSuccess)
            {
                return Result<RegisterUserResult>.Failure(rolesResult.Error!, rolesResult.ErrorCode);
            }
            var roles = rolesResult.Value!.ToList();

            var hashedPassword = _passwordHasher.HashPassword(req.Password);
            var newUser = User.Create(req.Name, req.Email, hashedPassword, User.DEFAULT_PROFILE_PICTURE_URL);

            foreach (var role in roles)
            {
                newUser.AddRole(role);
            }

            var roleNames = roles.Select(r => r.Name).ToList();
            if (roleNames.Contains("Freelancer", StringComparer.OrdinalIgnoreCase))
            {
                newUser.SetFreelancerProfile(LittleService.Domain.Entities.Freelancer.Create(newUser.Id));
            }
            if (roleNames.Contains("Client", StringComparer.OrdinalIgnoreCase))
            {
                newUser.SetClientProfile(LittleService.Domain.Entities.Client.Create(newUser.Id));
            }

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

            var tokens = await _authTokenIssuer.IssueAsync(newUser, cancellationToken: cancellationToken);

            return Result<RegisterUserResult>.Success(new RegisterUserResult
            {
                Token = tokens.Token,
                ExpiresAt = tokens.ExpiresAt,
                RefreshToken = tokens.RefreshToken,
                RefreshTokenExpiresAt = tokens.RefreshTokenExpiresAt,
                User = tokens.User
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

    private async Task<Result<IEnumerable<Role>>> ValidateAndGetRolesAsync(IEnumerable<string> roleNames, CancellationToken cancellationToken)
    {
        var rolesList = roleNames
            .Select(r => r.Trim())
            .Where(r => !string.IsNullOrWhiteSpace(r))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        if (rolesList.Count == 0)
            return Result<IEnumerable<Role>>.Failure("Debe especificar al menos un rol", "NO_ROLES_SPECIFIED");

        var validRoles = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { "Freelancer", "Client" };
        if (rolesList.Any(r => !validRoles.Contains(r)))
            return Result<IEnumerable<Role>>.Failure("Los roles no son válidos", "INVALID_ROLES");

        var roles = await _unitOfWork.Roles.GetByNamesAsync(rolesList, cancellationToken);
        var rolesArray = roles.ToArray();
        foreach (var roleName in rolesList)
        {
            if (!rolesArray.Any(r => r.Name.Equals(roleName, StringComparison.OrdinalIgnoreCase)))
                return Result<IEnumerable<Role>>.Failure("Los roles especificados no existen", "ROLES_NOT_FOUND");
        }
        return Result<IEnumerable<Role>>.Success(rolesArray);
    }
}
