using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Auth.LoginUser;

public class LoginUserCommandHandler : IRequestHandler<LoginUserCommand, Result<LoginUserResult>>
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

    public async ValueTask<Result<LoginUserResult>> Handle(LoginUserCommand command, CancellationToken cancellationToken)
    {
        try
        {
            var req = command.Request;
            var user = await _unitOfWork.Users.GetByEmailAsync(req.Email.Trim().ToLowerInvariant(), cancellationToken);
            if (user == null)
            {
                return Result<LoginUserResult>.Failure("Credenciales inválidas", "INVALID_CREDENTIALS");
            }

            if (!user.IsUserActive())
            {
                return Result<LoginUserResult>.Failure(
                    "Tu cuenta ha sido desactivada. Por favor, contacta al soporte.",
                    "USER_INACTIVE");
            }

            if (!_passwordHasher.VerifyPassword(req.Password, user.Password))
            {
                return Result<LoginUserResult>.Failure("Credenciales inválidas", "INVALID_CREDENTIALS");
            }

            user.RecordLogin();
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            var token = _tokenGenerator.GenerateToken(user);
            var expiresAt = _tokenGenerator.GetTokenExpirationDate(token);
            var userDto = _mapper.Map<UserDto>(user);

            return Result<LoginUserResult>.Success(new LoginUserResult
            {
                Token = token,
                ExpiresAt = expiresAt,
                User = userDto
            });
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
