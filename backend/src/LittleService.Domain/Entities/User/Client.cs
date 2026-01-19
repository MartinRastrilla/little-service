using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class Client : BaseEntity
{
    // ====================================================================
    // CONSTANTS
    // ====================================================================

    public const int MAX_ADDRESS_LENGTH = 500;

    public User User { get; private set; } = null!;
    public string? Address { get; private set; }

    public int TotalContracts { get; private set; } = 0;

    /* === Relationships === */
    public ICollection<ServiceRequest> ServiceRequests { get; private set; } = new List<ServiceRequest>();

    private Client() { }

    // ====================================================================
    // FACTORY METHOD - Creation of Client
    // ====================================================================

    /// <summary>
    /// Creates a new Client for a User.
    /// The Client profile starts with default values (0 total contracts).
    /// </summary>
    /// <param name="userId">ID of the User that will be associated with this Client</param>
    /// <returns>New Client instance with default values</returns>
    public static Client Create(Guid userId)
    {
        return new Client
        {
            Id = userId, //? Shared primary key with User (1:1 relationship)
            Address = null,
            TotalContracts = 0,
            CreatedAt = DateTime.UtcNow
        };
    }

    // ====================================================================
    // BUSINESS METHODS - Modification of data
    // ====================================================================

    /// <summary>
    /// Updates the client's address.
    /// </summary>
    /// <param name="address">New address (can be null or empty to remove)</param>
    /// <exception cref="DomainException">If validations fail</exception>
    public void UpdateAddress(string? address)
    {
        if (string.IsNullOrWhiteSpace(address))
        {
            Address = null;
        }
        else
        {
            string trimmedAddress = address.Trim();
            ValidateAddress(trimmedAddress);
            Address = trimmedAddress;
        }
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Increments the count of total contracts.
    /// </summary>
    public void IncrementTotalContracts()
    {
        TotalContracts++;
        UpdatedAt = DateTime.UtcNow;
    }

    // ====================================================================
    // QUERY METHODS - No side effects
    // ====================================================================

    /// <summary>
    /// Indicates if the client has an address.
    /// </summary>
    public bool HasAddress() => !string.IsNullOrWhiteSpace(Address);

    /// <summary>
    /// Indicates if the client has any contracts.
    /// </summary>
    public bool HasContracts() => TotalContracts > 0;

    // ====================================================================
    // PRIVATE VALIDATION METHODS
    // ====================================================================

    private static void ValidateAddress(string address)
    {
        if (address.Length > MAX_ADDRESS_LENGTH)
        {
            throw new DomainException(
                $"La dirección no puede exceder {MAX_ADDRESS_LENGTH} caracteres",
                "ADDRESS_TOO_LONG");
        }
    }
}
