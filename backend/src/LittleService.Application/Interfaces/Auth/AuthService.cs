using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using LittleService.Application.DTOs;
using LittleService.Application.DTOs.Common;
using LittleService.Application.Mappings;
using LittleService.Domain.Entities;
using LittleService.Infrastructure.Repositories;
using LittleService.Infrastructure.Repositories.Roles;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace LittleService.Application.Interfaces;

public class AuthService : IAuthService
{
    private readonly IUserRepository _userRepository;
    private readonly IRoleRepository _roleRepository;
    private readonly IConfiguration _configuration;
    private readonly IPasswordHasher _passwordHasher;

    public AuthService(
        IUserRepository userRepository,
        IRoleRepository roleRepository,
        IConfiguration configuration,
        IPasswordHasher passwordHasher)
    {
        _userRepository = userRepository;
        _roleRepository = roleRepository;
        _configuration = configuration;
        _passwordHasher = passwordHasher;
    }

    public async Task<Result<AuthResponseDto>> RegisterAsync(RegisterDto registerDto)
    {
        //? Validate passwords match
        if (registerDto.Password != registerDto.ConfirmPassword)
        {
            return Result<AuthResponseDto>.Failure("Las contraseñas no coinciden", "PASSWORDS_DONT_MATCH");
        }

        //? Validate password strength
        var passwordValidation = ValidatePasswordStrength(registerDto.Password);
        if (!passwordValidation.IsSuccess)
        {
            return Result<AuthResponseDto>.Failure(passwordValidation.Error!, passwordValidation.ErrorCode);
        }

        //? Check if user already exists
        var existingUser = await _userRepository.GetByEmailAsync(registerDto.Email);
        if (existingUser is not null)
        {
            return Result<AuthResponseDto>.Failure("El usuario ya existe", "USER_ALREADY_EXISTS");
        }

        //? Validate and get roles
        var rolesValidation = await ValidateAndGetRolesAsync(registerDto.Roles);
        if (!rolesValidation.IsSuccess)
        {
            return Result<AuthResponseDto>.Failure(rolesValidation.Error!, rolesValidation.ErrorCode);
        }

        var roles = rolesValidation.Value!.ToList();

        //? Create user with roles
        var newUser = new User
        {
            Id = Guid.NewGuid(),
            Name = registerDto.Name,
            Email = registerDto.Email.ToLowerInvariant(),
            Password = _passwordHasher.HashPassword(registerDto.Password),
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow,
            UserRoles = rolesValidation.Value!.Select(role => new UserRole
            {
                RoleId = role.Id,
                Role = role
            }).ToList()
        };

        //? Add freelancer or client to user
        var roleNames = roles.Select(role => role.Name).ToList();

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

        //? Add user to database (EF Core guardará UserRoles automáticamente)
        var createdUser = await _userRepository.AddAsync(newUser);

        //? Generate token
        var token = GenerateJwtToken(createdUser);

        var response = new AuthResponseDto
        {
            Token = token,
            ExpiresAt = DateTime.UtcNow.AddDays(15),
            User = UserMapper.ToDto(createdUser),
        };

        return Result<AuthResponseDto>.Success(response);
    }

    public async Task<Result<AuthResponseDto>> LoginAsync(LoginDto loginDto)
    {
        //? Check if user exists
        var user = await _userRepository.GetByEmailAsync(loginDto.Email.ToLowerInvariant());
        if (user is null)
        {
            return Result<AuthResponseDto>.Failure("Credenciales inválidas", "INVALID_CREDENTIALS");
        }

        //? Check if password is correct
        if (!_passwordHasher.VerifyPassword(loginDto.Password, user.Password))
        {
            return Result<AuthResponseDto>.Failure("Credenciales inválidas", "INVALID_CREDENTIALS");
        }

        //? Generate token
        var token = GenerateJwtToken(user);

        var response = new AuthResponseDto
        {
            Token = token,
            ExpiresAt = DateTime.UtcNow.AddDays(15),
            User = UserMapper.ToDto(user),
        };

        return Result<AuthResponseDto>.Success(response);
    }

    public async Task<Result<bool>> ValidateUserAsync(string email, string password)
    {
        var user = await _userRepository.GetByEmailAsync(email.ToLowerInvariant());
        if (user is null)
        {
            return Result<bool>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        }

        var isValid = _passwordHasher.VerifyPassword(password, user.Password);
        return Result<bool>.Success(isValid);
    }

    public string GenerateJwtToken(User user)
    {
        var jwtKey = _configuration["Jwt:Key"] ?? "YourSuperSecretKeyForJWT123456789012345";
        var jwtIssuer = _configuration["Jwt:Issuer"] ?? "LittleService";

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new(ClaimTypes.Name, user.Name),
            new(ClaimTypes.Email, user.Email),
            new(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new(JwtRegisteredClaimNames.Iat,
                new DateTimeOffset(DateTime.UtcNow).ToUnixTimeSeconds().ToString(),
                ClaimValueTypes.Integer64)
        };

        //? Add roles
        if (user.UserRoles != null && user.UserRoles.Count != 0)
        {
            foreach (var userRole in user.UserRoles)
            {
                if (userRole?.Role?.Name != null)
                {
                    claims.Add(new Claim(ClaimTypes.Role, userRole.Role.Name));
                }
            }
        }

        var token = new JwtSecurityToken(
            issuer: jwtIssuer,
            audience: jwtIssuer,
            claims: claims,
            expires: DateTime.UtcNow.AddDays(15),
            signingCredentials: credentials
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    private static Result ValidatePasswordStrength(string password)
    {
        if (string.IsNullOrWhiteSpace(password))
            return Result.Failure("La contraseña no puede estar vacía", "PASSWORD_EMPTY");

        if (password.Length < 8)
            return Result.Failure("La contraseña debe tener al menos 8 caracteres", "PASSWORD_TOO_SHORT");

        if (password.Length > 28)
            return Result.Failure("La contraseña no puede tener más de 28 caracteres", "PASSWORD_TOO_LONG");

        // Verificar que tenga al menos una letra mayúscula, una minúscula y un número
        if (!password.Any(char.IsUpper))
            return Result.Failure("La contraseña debe contener al menos una letra mayúscula", "PASSWORD_NO_UPPERCASE");

        if (!password.Any(char.IsLower))
            return Result.Failure("La contraseña debe contener al menos una letra minúscula", "PASSWORD_NO_LOWERCASE");

        if (!password.Any(char.IsDigit))
            return Result.Failure("La contraseña debe contener al menos un número", "PASSWORD_NO_DIGIT");

        return Result.Success();
    }

    private async Task<Result<IEnumerable<Role>>> ValidateAndGetRolesAsync(IEnumerable<string> roleNames)
    {
        var rolesList = roleNames
        .Select(r => r.Trim())
        .Where(r => !string.IsNullOrWhiteSpace(r))
        .Distinct(StringComparer.OrdinalIgnoreCase)
        .ToList();

        // Validar que se especifiquen roles
        if (rolesList.Count == 0)
        {
            return Result<IEnumerable<Role>>.Failure("Debe especificar al menos un rol", "NO_ROLES_SPECIFIED");
        }

        //? Validate that the roles are in the public roles
        if (rolesList.Any(r => !PUBLIC_ROLES.Contains(r)))
        {
            return Result<IEnumerable<Role>>.Failure("Los roles no son válidos", "INVALID_ROLES");
        }

        // Obtener todos los roles de una vez (eficiente)
        var roles = await _roleRepository.GetByNamesAsync(rolesList);

        var rolesArray = roles.ToArray();

        // Verificar que todos los roles existan
        foreach (var role in rolesList)
        {
            if (!rolesArray.Any(r => r.Name == role))
            {
                return Result<IEnumerable<Role>>.Failure("Los roles no existen", "ROLES_NOT_FOUND");
            }
        }

        return Result<IEnumerable<Role>>.Success(rolesArray);
    }

    //? White list of public roles
    private static readonly HashSet<string> PUBLIC_ROLES = new(StringComparer.OrdinalIgnoreCase)
    {
        "Freelancer", "Client"
    };
}