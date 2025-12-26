using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Users;
using LittleService.Application.Interfaces.Services;
using LittleService.Domain.Interfaces.Repositories;

namespace LittleService.Application.UseCases.Auth.LoginUser;

public class LoginUserCommandHandler
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly ITokenGenerator _tokenGenerator;
    private readonly IMapper _mapper;

    public LoginUserCommandHandler(IUnitOfWork unitOfWork, IPasswordHasher passwordHasher, ITokenGenerator tokenGenerator, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _tokenGenerator = tokenGenerator;
        _mapper = mapper;
    }

    public async Task<Result<LoginUserResult>> HandleAsync(LoginUserCommand command, CancellationToken cancellationToken = default)
    {
        //? 1. Verify user exists
        var user = await _unitOfWork.Users.GetByEmailAsync(command.Email.Trim().ToLowerInvariant(), cancellationToken);
        if (user == null)
        {
            //? For security reasons, we don't want to reveal if the user exists or not
            return Result<LoginUserResult>.Failure(
                "Credenciales inválidas",
                "INVALID_CREDENTIALS");
        }

        //? 2. Verify password is correct
        if (!_passwordHasher.VerifyPassword(command.Password, user.Password))
        {
            return Result<LoginUserResult>.Failure(
                "Credenciales inválidas",
                "INVALID_CREDENTIALS");
        }

        //? 3. Generar token
        var token = _tokenGenerator.GenerateToken(user);
        var expiresAt = _tokenGenerator.GetTokenExpirationDate(token);

        //? 4. Mapear a DTO
        var userDto = _mapper.Map<UserDto>(user);

        //? 5. Retornar resultado
        var result = new LoginUserResult
        {
            Token = token,
            ExpiresAt = expiresAt,
            User = userDto
        };

        return Result<LoginUserResult>.Success(result);
    }
}