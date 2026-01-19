using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class Rating : BaseEntity
{
    public const int MAX_EDIT_COUNT = 2;
    public const int MAX_COMMENT_LENGTH = 1000;
    public const int MIN_SCORE = 1;
    public const int MAX_SCORE = 5;

    public int Score { get; private set; }

    public string? Comment { get; private set; }

    public bool IsActive { get; private set; } = true;

    public int EditCountWhileDeactivated { get; private set; } = 0;

    public DateTime? DeactivatedAt { get; private set; }

    public User? DeactivatedBy { get; private set; }
    public Guid? DeactivatedById { get; private set; }

    public RatingReceiverRole ReceiverRole { get; private set; }

    public Guid ServiceRequestId { get; private set; }
    public ServiceRequest ServiceRequest { get; private set; } = null!;

    public Guid UserRevieweeId { get; private set; }
    public User UserReviewee { get; private set; } = null!;

    public Guid UserReviewerId { get; private set; }
    public User UserReviewer { get; private set; } = null!;

    private Rating() { }

    // ====================================================================
    // FACTORY METHOD - Creation of Rating
    // ====================================================================

    /// <summary>
    /// Creates a new Rating.
    /// The Contract must be completed before creating a rating.
    /// </summary>
    /// <param name="serviceRequestId">ID of the ServiceRequest</param>
    /// <param name="userRevieweeId">ID of the user being rated</param>
    /// <param name="userReviewerId">ID of the user giving the rating</param>
    /// <param name="score">Rating score (1-5)</param>
    /// <param name="comment">Optional comment</param>
    /// <param name="receiverRole">Role by which the user is being rated (Client or Freelancer)</param>
    /// <param name="serviceRequest">The ServiceRequest entity (for validation)</param>
    /// <returns>New Rating instance</returns>
    /// <exception cref="DomainException">If validations fail</exception>
    public static Rating Create(
        Guid serviceRequestId,
        Guid userRevieweeId,
        Guid userReviewerId,
        int score,
        string? comment,
        RatingReceiverRole receiverRole,
        ServiceRequest serviceRequest)
    {
        // Validar Contract completado
        if (serviceRequest.Contract == null)
        {
            throw new DomainException(
                "No se puede crear una calificación sin un contrato",
                "CONTRACT_REQUIRED");
        }

        if (!serviceRequest.Contract.IsCompleted())
        {
            throw new DomainException(
                "El contrato debe estar completado antes de crear una calificación",
                "CONTRACT_NOT_COMPLETED");
        }

        // Validar que ServiceRequest corresponde
        if (serviceRequest.Id != serviceRequestId)
        {
            throw new DomainException(
                "El trabajo no coincide",
                "SERVICE_REQUEST_MISMATCH");
        }

        // Validar que no se está calificando a sí mismo
        if (userRevieweeId == userReviewerId)
        {
            throw new DomainException(
                "No se puede calificar a sí mismo",
                "CANNOT_RATE_SELF");
        }

        // Validar score
        ValidateScore(score);

        // Validar comment si se proporciona
        if (!string.IsNullOrWhiteSpace(comment))
        {
            ValidateComment(comment);
        }

        // Validar que el receiverRole es válido según el ServiceRequest
        ValidateReceiverRole(receiverRole, serviceRequest, userRevieweeId, userReviewerId);

        return new Rating
        {
            Id = Guid.NewGuid(),
            ServiceRequestId = serviceRequestId,
            UserRevieweeId = userRevieweeId,
            UserReviewerId = userReviewerId,
            Score = score,
            Comment = comment?.Trim(),
            ReceiverRole = receiverRole,
            CreatedAt = DateTime.UtcNow
        };
    }

    /// <summary>
    /// Creates a new Rating for a Freelancer.
    /// </summary>
    /// <param name="serviceRequestId">ID of the ServiceRequest</param>
    /// <param name="userRevieweeId">ID of the user being rated</param>
    /// <param name="userReviewerId">ID of the user giving the rating</param>
    /// <param name="score">Rating score (1-5)</param>
    /// <param name="comment">Optional comment</param>
    /// <param name="serviceRequest">The ServiceRequest entity (for validation)</param>
    /// <returns>New Rating instance</returns>
    /// <exception cref="DomainException">If validations fail</exception>
    public static Rating CreateForFreelancer(
        Guid serviceRequestId,
        Guid userRevieweeId,
        Guid userReviewerId,
        int score,
        string? comment,
        ServiceRequest serviceRequest)
    {
        Rating rating = Create(
            serviceRequestId,
            userRevieweeId,
            userReviewerId,
            score,
            comment,
            RatingReceiverRole.Freelancer,
            serviceRequest);
        return rating;
    }

    /// <summary>
    /// Creates a new Rating for a Client.
    /// </summary>
    /// <param name="serviceRequestId">ID of the ServiceRequest</param>
    /// <param name="userRevieweeId">ID of the user being rated</param>
    /// <param name="userReviewerId">ID of the user giving the rating</param>
    /// <param name="score">Rating score (1-5)</param>
    /// <param name="comment">Optional comment</param>
    /// <param name="serviceRequest">The ServiceRequest entity (for validation)</param>
    /// <returns>New Rating instance</returns>
    /// <exception cref="DomainException">If validations fail</exception>
    public static Rating CreateForClient(
        Guid serviceRequestId,
        Guid userRevieweeId,
        Guid userReviewerId,
        int score,
        string? comment,
        ServiceRequest serviceRequest)
    {
        Rating rating = Create(
            serviceRequestId,
            userRevieweeId,
            userReviewerId,
            score,
            comment,
            RatingReceiverRole.Client,
            serviceRequest);
        return rating;
    }

    // ====================================================================
    // BUSINESS METHODS - Modification of data
    // ====================================================================

    /// <summary>
    /// Updates the rating comment.
    /// Can only be edited if the rating is deactivated (moderated) and hasn't exceeded the edit limit.
    /// Comment can be null/empty to remove it.
    /// </summary>
    /// <param name="comment">New comment (can be null/empty to remove)</param>
    public void UpdateComment(string? comment)
    {
        // Solo se puede editar si está desactivada (moderada)
        if (IsActive)
        {
            throw new DomainException(
                "Solo se puede editar una calificación que ha sido moderada (desactivada)",
                "RATING_NOT_MODERATED");
        }

        // Validar que se puede editar (no ha excedido el límite de ediciones)
        if (!CanBeEdited())
        {
            throw new DomainException(
                $"No se puede editar. Ya se alcanzó el límite de {MAX_EDIT_COUNT} ediciones. La calificación será eliminada permanentemente",
                "RATING_EDIT_LIMIT_EXCEEDED");
        }

        // Permitir null/empty (eliminar comentario)
        if (string.IsNullOrWhiteSpace(comment))
        {
            if (Comment == null)
            {
                throw new DomainException(
                    "El comentario no ha cambiado",
                    "COMMENT_NO_CHANGE");
            }

            Comment = null;
        }
        else
        {
            string trimmedComment = comment.Trim();

            if (Comment == trimmedComment)
            {
                throw new DomainException(
                    "El comentario no ha cambiado",
                    "COMMENT_NO_CHANGE");
            }

            ValidateComment(trimmedComment);
            Comment = trimmedComment;
        }

        // Incrementar contador de ediciones
        EditCountWhileDeactivated++;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Deactivates the rating.
    /// </summary>
    public void DeactivateByModerator(User moderator)
    {
        if (!IsActive)
        {
            throw new DomainException(
                "La calificación ya está desactivada",
                "RATING_ALREADY_DEACTIVATED");
        }

        IsActive = false;
        DeactivatedAt = DateTime.UtcNow;
        DeactivatedById = moderator.Id;
        DeactivatedBy = moderator;
    }

    /// <summary>
    /// Deactivates the rating by the user who created it.
    /// </summary>
    public void DeactivateByHimself()
    {
        if (!IsActive)
        {
            throw new DomainException(
                "La calificación ya está desactivada",
                "RATING_ALREADY_DEACTIVATED");
        }

        IsActive = false;
        DeactivatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Indicates if the rating should be permanently deleted.
    /// This happens when the rating is deactivated and has reached the maximum edit count.
    /// </summary>
    public bool ShouldBePermanentlyDeleted() => !IsActive && EditCountWhileDeactivated >= MAX_EDIT_COUNT;

    // ====================================================================
    // QUERY METHODS - No side effects
    // ====================================================================

    /// <summary>
    /// Indicates if the rating is for a Client role.
    /// </summary>
    public bool IsForClient() => ReceiverRole == RatingReceiverRole.Client;

    /// <summary>
    /// Indicates if the rating is for a Freelancer role.
    /// </summary>
    public bool IsForFreelancer() => ReceiverRole == RatingReceiverRole.Freelancer;

    /// <summary>
    /// Indicates if the rating is active.
    /// </summary>
    public bool IsRatingActive() => IsActive;

    /// <summary>
    /// Indicates if the rating is deactivated.
    /// </summary>
    public bool IsDeactivated() => !IsActive;

    /// <summary>
    /// Indicates if the rating can be edited.
    /// Can only be edited if it's deactivated (moderated) and hasn't exceeded the edit limit.
    /// </summary>
    public bool CanBeEdited() => !IsActive && EditCountWhileDeactivated < MAX_EDIT_COUNT;

    // ====================================================================
    // PRIVATE METHODS - Validations and helpers
    // ====================================================================

    /// <summary>
    /// Validates the rating score.
    /// </summary>
    private static void ValidateScore(int score)
    {
        if (score < MIN_SCORE || score > MAX_SCORE)
        {
            throw new DomainException(
                $"La calificación debe estar entre {MIN_SCORE} y {MAX_SCORE}",
                "INVALID_SCORE");
        }
    }

    /// <summary>
    /// Validates the rating comment.
    /// Comment is optional, but if provided, it must not exceed the maximum length.
    /// </summary>
    private static void ValidateComment(string comment)
    {
        if (string.IsNullOrWhiteSpace(comment))
        {
            return; // Comment is optional
        }

        if (comment.Trim().Length > MAX_COMMENT_LENGTH)
        {
            throw new DomainException(
                $"El comentario no puede exceder {MAX_COMMENT_LENGTH} caracteres",
                "COMMENT_TOO_LONG");
        }
    }

    /// <summary>
    /// Validates that the receiver role matches the ServiceRequest context.
    /// </summary>
    private static void ValidateReceiverRole(
        RatingReceiverRole receiverRole,
        ServiceRequest serviceRequest,
        Guid userRevieweeId,
        Guid userReviewerId)
    {
        if (receiverRole == RatingReceiverRole.Client)
        {
            // The reviewer must be the client of the ServiceRequest
            if (serviceRequest.ClientId != userRevieweeId)
            {
                throw new DomainException(
                    "El usuario a calificar como Cliente debe ser el cliente del trabajo",
                    "INVALID_CLIENT_RATING");
            }

            // The reviewer must be the Freelancer
            if (!serviceRequest.FreelancerPickedId.HasValue ||
                serviceRequest.FreelancerPickedId.Value != userReviewerId)
            {
                throw new DomainException(
                    "El usuario que califica debe ser el freelancer asignado al trabajo",
                    "INVALID_REVIEWER_FOR_CLIENT_RATING");
            }
        }
        else if (receiverRole == RatingReceiverRole.Freelancer)
        {
            // The reviewer must be the freelancer assigned to the ServiceRequest
            if (!serviceRequest.FreelancerPickedId.HasValue ||
                serviceRequest.FreelancerPickedId.Value != userRevieweeId)
            {
                throw new DomainException(
                    "El usuario a calificar como Freelancer debe ser el freelancer asignado al trabajo",
                    "INVALID_FREELANCER_RATING");
            }

            // The reviewer must be the Client
            if (serviceRequest.ClientId != userReviewerId)
            {
                throw new DomainException(
                    "El usuario que califica debe ser el cliente del trabajo",
                    "INVALID_REVIEWER_FOR_FREELANCER_RATING");
            }
        }
    }
}