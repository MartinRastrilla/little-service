using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Auth.LoginUser;

public class LoginUserCommandHandler
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ITokenGenerator _tokenGenerator;
    private readonly IMapper _mapper;
    private readonly ILogger<LoginUserCommandHandler> _logger;

    public LoginUserCommandHandler(IUnitOfWork unitOfWork, IPasswordHasher passwordHasher, ITokenGenerator tokenGenerator, IMapper mapper, ILogger<LoginUserCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _tokenGenerator = tokenGenerator;
        _mapper = mapper;
        _logger = logger;
    }

    public async Task<Result<LoginUserResult>> HandleAsync(LoginUserCommand command, CancellationToken cancellationToken = default)
    {
        try
        {
            //? 1. Verificar que el usuario exista
            var user = await _unitOfWork.Users.GetByEmailAsync(command.Email.Trim().ToLowerInvariant(), cancellationToken);
            if (user == null)
            {
                //? Por razones de seguridad, no queremos revelar si el usuario existe o no
                return Result<LoginUserResult>.Failure(
                    "Credenciales inválidas",
                    "INVALID_CREDENTIALS");
            }

            //? 2. Verificar que el usuario esté activo
            if (!user.IsUserActive())
            {
                return Result<LoginUserResult>.Failure(
                    "Tu cuenta ha sido desactivada. Por favor, contacta al soporte.",
                    "USER_INACTIVE");
            }

            //? 3. Verificar que la contraseña sea correcta
            if (!_passwordHasher.VerifyPassword(command.Password, user.Password))
            {
                return Result<LoginUserResult>.Failure(
                    "Credenciales inválidas",
                    "INVALID_CREDENTIALS");
            }

            //? 4. Registrar el login usando método de dominio
            user.RecordLogin();

            //? 5. Guardar el cambio del LastLogin
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            //? 6. Generar token
            var token = _tokenGenerator.GenerateToken(user);
            var expiresAt = _tokenGenerator.GetTokenExpirationDate(token);

            //? 7. Mapear a DTO
            var userDto = _mapper.Map<UserDto>(user);

            //? 8. Retornar resultado
            var result = new LoginUserResult
            {
                Token = token,
                ExpiresAt = expiresAt,
                User = userDto
            };

            return Result<LoginUserResult>.Success(result);
        }
        catch (DomainException ex)
        {
            _logger.LogWarning(ex, "Domain validation failed during login: {ErrorCode}", ex.ErrorCode);
            return Result<LoginUserResult>.Failure(ex.Message, ex.ErrorCode);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Unexpected error during login");
            return Result<LoginUserResult>.Failure(
                "Ocurrió un error al iniciar sesión. Por favor, intente más tarde.",
                "LOGIN_ERROR");
        }
    }
}