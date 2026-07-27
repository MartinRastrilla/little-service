using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class User : BaseEntity
{
    // ====================================================================
    // CONSTANTS
    // ====================================================================

    public const int MIN_PASSWORD_LENGTH = 8;
    public const int MAX_PASSWORD_LENGTH = 28;
    public const int MIN_NAME_LENGTH = 2;
    public const int MAX_NAME_LENGTH = 200;
    public const int MAX_EMAIL_LENGTH = 100;
    public const int MAX_PROFILE_PICTURE_URL_LENGTH = 255;
    public const string DEFAULT_PROFILE_PICTURE_URL = "images/default_profile_pic.png";

    //? Image formats allowed (extensions)
    private static readonly HashSet<string> AllowedImageExtensions = new(StringComparer.OrdinalIgnoreCase)
    {
        ".jpeg", ".jpg", ".png", ".heic", ".heif", ".webp", ".svg", ".ico", ".bmp", ".tiff", ".tif"
    };

    public string Name { get; private set; } = string.Empty;

    public string Email { get; private set; } = string.Empty;

    public string Password { get; private set; } = string.Empty;

    public string? ProfilePictureUrl { get; private set; }

    public DateTime? LastLogin { get; private set; }

    public bool IsActive { get; private set; } = true;

    /* === Relationships === */
    public ICollection<UserRole> UserRoles { get; private set; } = new List<UserRole>();
    public Freelancer? Freelancer { get; private set; }
    public Client? Client { get; private set; }
    public ICollection<Message> Messages { get; private set; } = new List<Message>();
    public ICollection<Notification> Notifications { get; private set; } = new List<Notification>();
    public ICollection<Rating> Ratings { get; private set; } = new List<Rating>();
    public ICollection<Report> Reports { get; private set; } = new List<Report>();
    public ICollection<Payment> Payments { get; private set; } = new List<Payment>();
    public ICollection<RefreshToken> RefreshTokens { get; private set; } = new List<RefreshToken>();

    private User() { }

    // ====================================================================
    // FACTORY METHOD - Creation of User
    // ====================================================================

    /// <summary>
    /// Creates a new User.
    /// Password must be provided as plain text (will be hashed by the handler).
    /// </summary>
    /// <param name="name">User's full name</param>
    /// <param name="email">User's email address (must be unique)</param>
    /// <param name="hashedPassword">Already hashed password (hashed by handler)</param>
    /// <param name="profilePictureUrl">Optional profile picture URL</param>
    /// <returns>New User instance</returns>
    /// <exception cref="DomainException">If validations fail</exception>
    public static User Create(
        string name,
        string email,
        string hashedPassword,
        string? profilePictureUrl = null)
    {
        ValidateName(name);
        ValidateEmail(email);

        if (string.IsNullOrEmpty(hashedPassword))
        {
            throw new DomainException(
                "La contraseña no puede ser nula o vacía",
                "PASSWORD_CANNOT_BE_NULL_OR_EMPTY");
        }

        var user = new User
        {
            Id = Guid.NewGuid(),
            Name = name.Trim(),
            Email = email.Trim().ToLowerInvariant(),
            Password = hashedPassword,
            ProfilePictureUrl = profilePictureUrl?.Trim(),
            IsActive = true,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        // Validate profile picture URL if provided
        if (!string.IsNullOrEmpty(profilePictureUrl))
        {
            ValidateProfilePictureUrl(profilePictureUrl);
        }

        return user;
    }

    // ====================================================================
    // BUSINESS METHODS - Modification of data
    // ====================================================================

    /// <summary>
    /// Updates the user's name.
    /// </summary>
    /// <param name="name">New name</param>
    public void UpdateName(string name)
    {
        ValidateName(name);

        if (Name == name.Trim())
        {
            throw new DomainException(
                "El nombre no ha cambiado",
                "NAME_NO_CHANGE");
        }

        Name = name.Trim();
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Updates the user's profile picture URL.
    /// </summary>
    /// <param name="profilePictureUrl">New profile picture URL</param>
    public void UpdateProfilePicture(string? profilePictureUrl)
    {
        if (string.IsNullOrWhiteSpace(profilePictureUrl))
        {
            // Allow removing profile picture
            if (ProfilePictureUrl == DEFAULT_PROFILE_PICTURE_URL || string.IsNullOrEmpty(ProfilePictureUrl))
            {
                throw new DomainException(
                    "La foto de perfil no ha cambiado",
                    "PROFILE_PICTURE_NO_CHANGE");
            }

            ProfilePictureUrl = DEFAULT_PROFILE_PICTURE_URL;
        }
        else
        {
            string trimmedUrl = profilePictureUrl.Trim();

            if (ProfilePictureUrl == trimmedUrl)
            {
                throw new DomainException(
                    "La foto de perfil no ha cambiado",
                    "PROFILE_PICTURE_NO_CHANGE");
            }

            ValidateProfilePictureUrl(trimmedUrl);
            ProfilePictureUrl = trimmedUrl;
        }

        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Changes the user's password.
    /// Requires verification of the current password.
    /// </summary>
    /// <param name="currentHashedPassword">Current hashed password (for verification)</param>
    /// <param name="newHashedPassword">New hashed password</param>
    /// <exception cref="DomainException">If current password doesn't match or validations fail</exception>
    public void ChangePassword(string currentHashedPassword, string newHashedPassword)
    {
        // Verify current password
        if (Password != currentHashedPassword)
        {
            throw new DomainException(
                "La contraseña actual no es correcta",
                "CURRENT_PASSWORD_INCORRECT");
        }

        // Validate new password format (should be hashed)
        if (string.IsNullOrWhiteSpace(newHashedPassword))
        {
            throw new DomainException(
                "La nueva contraseña no puede estar vacía",
                "PASSWORD_EMPTY");
        }

        if (!newHashedPassword.StartsWith("$2") || newHashedPassword.Length < 50)
        {
            throw new DomainException(
                "La nueva contraseña no tiene un formato válido (debe estar hasheada)",
                "INVALID_PASSWORD_FORMAT");
        }

        // New password must be different from current
        if (Password == newHashedPassword)
        {
            throw new DomainException(
                "La nueva contraseña debe ser diferente de la actual",
                "PASSWORD_SAME_AS_CURRENT");
        }

        Password = newHashedPassword;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Records a login action by updating the LastLogin timestamp.
    /// </summary>
    public void RecordLogin()
    {
        LastLogin = DateTime.UtcNow;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Activates the user.
    /// Only Admin/Moderator can perform this action.
    /// When activated, Client and Freelancer profiles are also activated (handled by handler).
    /// </summary>
    /// <param name="activatedBy">User who is activating (Admin/Moderator)</param>
    public void Activate(User activatedBy)
    {
        if (IsActive)
        {
            throw new DomainException(
                "El usuario ya está activo",
                "USER_ALREADY_ACTIVE");
        }

        if (activatedBy.Id == Id)
        {
            throw new DomainException(
                "Un usuario no puede activarse a sí mismo",
                "CANNOT_ACTIVATE_SELF");
        }

        IsActive = true;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Deactivates the user.
    /// Only Admin/Moderator can perform this action.
    /// When deactivated, Client and Freelancer profiles are also deactivated (handled by handler).
    /// </summary>
    /// <param name="deactivatedBy">User who is deactivating (Admin/Moderator)</param>
    public void Deactivate(User deactivatedBy)
    {
        if (!IsActive)
        {
            throw new DomainException(
                "El usuario ya está desactivado",
                "USER_ALREADY_DEACTIVATED");
        }

        if (deactivatedBy.Id == Id)
        {
            throw new DomainException(
                "Un usuario no puede desactivarse a sí mismo a través de este método",
                "CANNOT_DEACTIVATE_SELF");
        }

        IsActive = false;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Adds a role to the user.
    /// If the role is "Freelancer" and the user doesn't have a Freelancer profile, it should be created (handled by handler).
    /// If the role is "Client" and the user doesn't have a Client profile, it should be created (handled by handler).
    /// </summary>
    /// <param name="role">Role to add</param>
    /// <exception cref="DomainException">If role is null or already assigned</exception>
    public void AddRole(Role role)
    {
        if (role == null)
        {
            throw new DomainException(
                "El rol no puede ser nulo",
                "ROLE_NULL");
        }

        // Check if role is already assigned
        if (UserRoles.Any(ur => ur.RoleId == role.Id))
        {
            throw new DomainException(
                $"El usuario ya tiene el rol '{role.Name}'",
                "ROLE_ALREADY_ASSIGNED");
        }

        var userRole = new UserRole
        {
            Id = Guid.NewGuid(),
            UserId = Id,
            User = this,
            RoleId = role.Id,
            Role = role
        };

        UserRoles.Add(userRole);
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Removes a role from the user.
    /// If removing "Freelancer" or "Client" role, the corresponding profile should be removed (handled by handler).
    /// </summary>
    /// <param name="role">Role to remove</param>
    /// <exception cref="DomainException">If role is null or not assigned</exception>
    public void RemoveRole(Role role)
    {
        if (role == null)
        {
            throw new DomainException(
                "El rol no puede ser nulo",
                "ROLE_NULL");
        }

        var userRole = UserRoles.FirstOrDefault(ur => ur.RoleId == role.Id);
        if (userRole == null)
        {
            throw new DomainException(
                $"El usuario no tiene el rol '{role.Name}'",
                "ROLE_NOT_ASSIGNED");
        }

        UserRoles.Remove(userRole);
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Sets the Freelancer profile for this user.
    /// This method should be called when a user is assigned the Freelancer role.
    /// </summary>
    /// <param name="freelancer">Freelancer instance to associate with this user</param>
    /// <exception cref="DomainException">If freelancer is null or already set</exception>
    public void SetFreelancerProfile(Freelancer freelancer)
    {
        if (freelancer == null)
        {
            throw new DomainException(
                "El perfil de Freelancer no puede ser nulo",
                "FREELANCER_NULL");
        }

        if (Freelancer != null)
        {
            throw new DomainException(
                "El usuario ya tiene un perfil de Freelancer",
                "FREELANCER_ALREADY_EXISTS");
        }

        if (freelancer.Id != Id)
        {
            throw new DomainException(
                "El ID del Freelancer debe coincidir con el ID del Usuario",
                "FREELANCER_ID_MISMATCH");
        }

        Freelancer = freelancer;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Sets the Client profile for this user.
    /// This method should be called when a user is assigned the Client role.
    /// </summary>
    /// <param name="client">Client instance to associate with this user</param>
    /// <exception cref="DomainException">If client is null or already set</exception>
    public void SetClientProfile(Client client)
    {
        if (client == null)
        {
            throw new DomainException(
                "El perfil de Client no puede ser nulo",
                "CLIENT_NULL");
        }

        if (Client != null)
        {
            throw new DomainException(
                "El usuario ya tiene un perfil de Client",
                "CLIENT_ALREADY_EXISTS");
        }

        if (client.Id != Id)
        {
            throw new DomainException(
                "El ID del Client debe coincidir con el ID del Usuario",
                "CLIENT_ID_MISMATCH");
        }

        Client = client;
        UpdatedAt = DateTime.UtcNow;
    }

    // ====================================================================
    // QUERY METHODS - No side effects
    // ====================================================================

    /// <summary>
    /// Indicates if the user is active.
    /// </summary>
    public bool IsUserActive() => IsActive;

    /// <summary>
    /// Indicates if the user has a specific role.
    /// </summary>
    /// <param name="roleName">Role name to check (case-insensitive)</param>
    public bool HasRole(string roleName)
    {
        if (string.IsNullOrWhiteSpace(roleName))
            return false;

        return UserRoles.Any(ur =>
            ur.Role != null &&
            ur.Role.Name.Equals(roleName.Trim(), StringComparison.OrdinalIgnoreCase));
    }

    /// <summary>
    /// Indicates if the user has the Client role.
    /// </summary>
    public bool IsClient() => HasRole("Client");

    /// <summary>
    /// Indicates if the user has the Freelancer role.
    /// </summary>
    public bool IsFreelancer() => HasRole("Freelancer");

    /// <summary>
    /// Indicates if the user has both Client and Freelancer roles.
    /// </summary>
    public bool IsBothClientAndFreelancer() => IsClient() && IsFreelancer();

    /// <summary>
    /// Indicates if the user has the Admin role.
    /// </summary>
    public bool IsAdmin() => HasRole("Admin");

    /// <summary>
    /// Indicates if the user has the Moderator role.
    /// </summary>
    public bool IsModerator() => HasRole("Moderator");

    /// <summary>
    /// Indicates if the user has the Support role.
    /// </summary>
    public bool IsSupport() => HasRole("Support");

    /// <summary>
    /// Indicates if the user has ever logged in.
    /// </summary>
    public bool HasLoggedIn() => LastLogin.HasValue;

    /// <summary>
    /// Gets the role names assigned to the user.
    /// </summary>
    public IEnumerable<string> GetRoleNames() =>
        UserRoles.Where(ur => ur.Role != null).Select(ur => ur.Role!.Name);

    // ====================================================================
    // PRIVATE METHODS - Validations and helpers
    // ====================================================================

    /// <summary>
    /// Validates the user's name.
    /// </summary>
    private static void ValidateName(string name)
    {
        if (string.IsNullOrWhiteSpace(name))
        {
            throw new DomainException(
                "El nombre no puede estar vacío",
                "NAME_EMPTY");
        }

        string trimmedName = name.Trim();

        if (trimmedName.Length < MIN_NAME_LENGTH)
        {
            throw new DomainException(
                $"El nombre debe tener al menos {MIN_NAME_LENGTH} caracteres",
                "NAME_TOO_SHORT");
        }

        if (trimmedName.Length > MAX_NAME_LENGTH)
        {
            throw new DomainException(
                $"El nombre no puede tener más de {MAX_NAME_LENGTH} caracteres",
                "NAME_TOO_LONG");
        }

        // Name should not be only whitespace or numbers
        if (trimmedName.All(char.IsDigit))
        {
            throw new DomainException(
                "El nombre no puede contener solo números",
                "NAME_ONLY_NUMBERS");
        }
    }

    /// <summary>
    /// Validates the user's email address.
    /// </summary>
    private static void ValidateEmail(string email)
    {
        if (string.IsNullOrWhiteSpace(email))
        {
            throw new DomainException(
                "El email no puede estar vacío",
                "EMAIL_EMPTY");
        }

        string trimmedEmail = email.Trim().ToLowerInvariant();

        if (trimmedEmail.Length > MAX_EMAIL_LENGTH)
        {
            throw new DomainException(
                $"El email no puede tener más de {MAX_EMAIL_LENGTH} caracteres",
                "EMAIL_TOO_LONG");
        }

        // Basic email format validation
        if (!IsValidEmailFormat(trimmedEmail))
        {
            throw new DomainException(
                "El formato del email no es válido",
                "INVALID_EMAIL_FORMAT");
        }
    }

    /// <summary>
    /// Validates email format using a simple regex pattern.
    /// </summary>
    private static bool IsValidEmailFormat(string email)
    {
        if (string.IsNullOrWhiteSpace(email))
            return false;

        try
        {
            // Simple email validation
            var emailRegex = new System.Text.RegularExpressions.Regex(
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                System.Text.RegularExpressions.RegexOptions.IgnoreCase,
                TimeSpan.FromMilliseconds(250));

            return emailRegex.IsMatch(email);
        }
        catch
        {
            return false;
        }
    }

    /// <summary>
    /// Validates the profile picture URL.
    /// Checks format (JPEG, JPG, PNG, HEIC, HEIF), URL validity, and file size constraints.
    /// Note: Actual file size validation (10MB) should be done at the upload handler level.
    /// </summary>
    private static void ValidateProfilePictureUrl(string url)
    {
        if (string.IsNullOrWhiteSpace(url))
        {
            throw new DomainException(
                "La URL de la foto de perfil no puede estar vacía",
                "PROFILE_PICTURE_URL_EMPTY");
        }

        if (url.Length > MAX_PROFILE_PICTURE_URL_LENGTH)
        {
            throw new DomainException(
                $"La URL de la foto de perfil no puede tener más de {MAX_PROFILE_PICTURE_URL_LENGTH} caracteres",
                "PROFILE_PICTURE_URL_TOO_LONG");
        }

        // Validate image extension
        var extension = System.IO.Path.GetExtension(url);
        if (string.IsNullOrEmpty(extension) || !AllowedImageExtensions.Contains(extension))
        {
            var allowedFormats = string.Join(", ", AllowedImageExtensions);
            throw new DomainException(
                $"El formato de la imagen no es válido. Formatos permitidos: {allowedFormats}",
                "INVALID_IMAGE_FORMAT");
        }
    }
}