using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class Freelancer : BaseEntity
{
    // ====================================================================
    // CONSTANTS
    // ====================================================================

    public const int MAX_BIO_LENGTH = 2000;
    public const int MAX_PROFESSION_LENGTH = 100;
    public const double MIN_RATING_AVERAGE = 0.0;
    public const double MAX_RATING_AVERAGE = 5.0;

    public User User { get; private set; } = null!;

    public string? Bio { get; private set; }
    public string? Profession { get; private set; }

    public double RatingAverage { get; private set; }
    public int RatingCount { get; private set; }
    public int CompletedJobs { get; private set; }

    /* === Relationships === */
    public ICollection<Service> Services { get; private set; } = new List<Service>();
    public ICollection<FreelancerApplication> FreelancerApplications { get; private set; } = new List<FreelancerApplication>();
    public ICollection<ServiceRequest> ServiceRequests { get; private set; } = new List<ServiceRequest>();
    public ICollection<Certificate> Certificates { get; private set; } = new List<Certificate>();
    public ICollection<FreelancerSkill> FreelancerSkills { get; private set; } = new List<FreelancerSkill>();

    private Freelancer() { }

    // ====================================================================
    // FACTORY METHOD - Creation of Freelancer
    // ====================================================================

    /// <summary>
    /// Creates a new Freelancer for a User.
    /// The Freelancer profile starts with default values (0 ratings, 0 completed jobs).
    /// </summary>
    /// <param name="userId">ID of the User that will be associated with this Freelancer</param>
    /// <returns>New Freelancer instance with default values</returns>
    public static Freelancer Create(Guid userId)
    {
        return new Freelancer
        {
            Id = userId, // Shared primary key with User (1:1 relationship)
            Bio = null,
            Profession = null,
            RatingAverage = 0.0,
            RatingCount = 0,
            CompletedJobs = 0,
            CreatedAt = DateTime.UtcNow
        };
    }

    // ====================================================================
    // BUSINESS METHODS - Modification of data
    // ====================================================================

    /// <summary>
    /// Updates the freelancer's bio.
    /// </summary>
    /// <param name="bio">New bio (can be null or empty to remove)</param>
    /// <exception cref="DomainException">If validations fail</exception>
    public void UpdateBio(string? bio)
    {
        if (string.IsNullOrWhiteSpace(bio))
        {
            Bio = null;
        }
        else
        {
            string trimmedBio = bio.Trim();
            ValidateBio(trimmedBio);
            Bio = trimmedBio;
        }
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Updates the freelancer's profession.
    /// </summary>
    /// <param name="profession">New profession (can be null or empty to remove)</param>
    /// <exception cref="DomainException">If validations fail</exception>
    public void UpdateProfession(string? profession)
    {
        if (string.IsNullOrWhiteSpace(profession))
        {
            Profession = null;
        }
        else
        {
            string trimmedProfession = profession.Trim();
            ValidateProfession(trimmedProfession);
            Profession = trimmedProfession;
        }
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Adds a rating to the freelancer's statistics.
    /// Automatically recalculates the rating average.
    /// </summary>
    /// <param name="score">Rating score (1-5)</param>
    /// <exception cref="DomainException">If validations fail</exception>
    public void AddRating(int score)
    {
        if (score < 1 || score > 5)
        {
            throw new DomainException(
                "El score de la calificación debe estar entre 1 y 5",
                "INVALID_RATING_SCORE");
        }

        //? Recalculate average: (currentAverage * currentCount + newScore) / (currentCount + 1)
        double newTotal = RatingAverage * RatingCount + score;
        RatingCount++;
        RatingAverage = Math.Round(newTotal / RatingCount, 2); //? Round to 2 decimal places
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Removes a rating from the freelancer's statistics.
    /// Automatically recalculates the rating average.
    /// </summary>
    /// <param name="score">Rating score (1-5) to remove</param>
    /// <exception cref="DomainException">If validations fail or there are no ratings</exception>
    public void RemoveRating(int score)
    {
        if (score < 1 || score > 5)
        {
            throw new DomainException(
                "El score de la calificación debe estar entre 1 y 5",
                "INVALID_RATING_SCORE");
        }

        if (RatingCount <= 0)
        {
            throw new DomainException(
                "No hay calificaciones para remover",
                "NO_RATINGS_TO_REMOVE");
        }

        //? Recalculate average: (currentAverage * currentCount - oldScore) / (currentCount - 1)
        double newTotal = RatingAverage * RatingCount - score;
        RatingCount--;

        if (RatingCount == 0)
        {
            RatingAverage = 0.0;
        }
        else
        {
            RatingAverage = Math.Round(newTotal / RatingCount, 2);
        }

        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Recalculates the rating average and count from a collection of ratings.
    /// Only considers active ratings for freelancers.
    /// </summary>
    /// <param name="ratings">Collection of ratings for this freelancer</param>
    public void RecalculateRatings(IEnumerable<Rating> ratings)
    {
        if (ratings == null)
        {
            throw new DomainException(
                "Las calificaciones no pueden ser nulas",
                "RATINGS_NULL");
        }

        var activeRatings = ratings
            .Where(r => r.IsRatingActive() && r.IsForFreelancer())
            .ToList();

        if (activeRatings.Count == 0)
        {
            RatingCount = 0;
            RatingAverage = 0.0;
        }
        else
        {
            RatingCount = activeRatings.Count;
            RatingAverage = Math.Round(activeRatings.Average(r => r.Score), 2);
        }

        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Increments the count of completed jobs.
    /// </summary>
    public void IncrementCompletedJobs()
    {
        CompletedJobs++;
        UpdatedAt = DateTime.UtcNow;
    }

    // ====================================================================
    // QUERY METHODS - No side effects
    // ====================================================================

    /// <summary>
    /// Indicates if the freelancer has a bio.
    /// </summary>
    public bool HasBio() => !string.IsNullOrWhiteSpace(Bio);

    /// <summary>
    /// Indicates if the freelancer has a profession.
    /// </summary>
    public bool HasProfession() => !string.IsNullOrWhiteSpace(Profession);

    /// <summary>
    /// Indicates if the freelancer has any ratings.
    /// </summary>
    public bool HasRatings() => RatingCount > 0;

    /// <summary>
    /// Indicates if the freelancer has completed any jobs.
    /// </summary>
    public bool HasCompletedJobs() => CompletedJobs > 0;

    // ====================================================================
    // PRIVATE VALIDATION METHODS
    // ====================================================================

    private static void ValidateBio(string bio)
    {
        if (bio.Length > MAX_BIO_LENGTH)
        {
            throw new DomainException(
                $"La biografía no puede exceder {MAX_BIO_LENGTH} caracteres",
                "BIO_TOO_LONG");
        }
    }

    private static void ValidateProfession(string profession)
    {
        if (profession.Length > MAX_PROFESSION_LENGTH)
        {
            throw new DomainException(
                $"La profesión no puede exceder {MAX_PROFESSION_LENGTH} caracteres",
                "PROFESSION_TOO_LONG");
        }
    }
}