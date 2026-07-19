using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class FreelancerApplication : BaseEntity
{
    public Guid ServiceRequestId { get; private set; }
    public ServiceRequest ServiceRequest { get; private set; } = null!;

    public Guid FreelancerId { get; private set; }
    public Freelancer Freelancer { get; private set; } = null!;

    public FreelancerApplicationStatus Status { get; private set; } = FreelancerApplicationStatus.Pending;

    private FreelancerApplication() { }


    // ====================================================================
    // FACTORY METHOD - Creation of FreelancerApplication
    // ====================================================================

    /// <summary>
    /// Creates a new FreelancerApplication in Pending status.
    /// The ServiceRequest must be able to accept applications.
    /// </summary>
    /// <param name="serviceRequestId">ID of the ServiceRequest</param>
    /// <param name="freelancerId">ID of the Freelancer applying</param>
    /// <param name="serviceRequest">The ServiceRequest entity (for validation)</param>
    /// <returns>New FreelancerApplication instance in Pending status</returns>
    /// <exception cref="DomainException">If validations fail</exception>
    public static FreelancerApplication Create(
        Guid serviceRequestId,
        Guid freelancerId,
        ServiceRequest serviceRequest)
    {
        if (!serviceRequest.CanAcceptApplications())
        {
            throw new DomainException(
                "No se puede aplicar a un trabajo que ya tiene un freelancer asignado",
                "SERVICE_REQUEST_ALREADY_HAS_FREELANCER");
        }

        if (serviceRequest.ClientId == freelancerId)
        {
            throw new DomainException(
                "Un freelancer no puede aplicar a su propio trabajo",
                "FREELANCER_IS_CLIENT");
        }

        // Note: Duplicate application check should be done in the handler
        // by querying the database for existing applications

        return new FreelancerApplication
        {
            Id = Guid.NewGuid(),
            ServiceRequestId = serviceRequestId,
            FreelancerId = freelancerId,
            Status = FreelancerApplicationStatus.Pending,
            CreatedAt = DateTime.UtcNow
        };
    }

    // ====================================================================
    // BUSINESS METHODS - Modification of data
    // ====================================================================

    /// <summary>
    /// Accepts the freelancer application.
    /// Transitions: Pending → Accepted
    /// Automatically assigns the freelancer to the ServiceRequest.
    /// </summary>
    /// <param name="serviceRequest">The ServiceRequest to assign the freelancer to</param>
    /// <exception cref="DomainException">If validations fail</exception>
    public void Accept(ServiceRequest serviceRequest)
    {
        if (Status == FreelancerApplicationStatus.Accepted)
            return; // Idempotent

        if (Status != FreelancerApplicationStatus.Pending)
        {
            throw new DomainException(
                "Solo se puede aceptar una aplicación pendiente",
                "APPLICATION_NOT_PENDING");
        }

        if (!serviceRequest.CanAcceptApplications())
        {
            throw new DomainException(
                "El trabajo ya no puede aceptar aplicaciones",
                "SERVICE_REQUEST_CANNOT_ACCEPT_APPLICATIONS");
        }

        if (serviceRequest.Id != ServiceRequestId)
        {
            throw new DomainException(
                "El trabajo no coincide con esta aplicación",
                "SERVICE_REQUEST_MISMATCH");
        }

        // Assign the freelancer to the ServiceRequest
        serviceRequest.AssignFreelancer(FreelancerId);
        serviceRequest.Close();

        // Change application status
        Status = FreelancerApplicationStatus.Accepted;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Rejects the freelancer application.
    /// Transitions: Pending → Rejected
    /// </summary>
    /// <exception cref="DomainException">If validations fail</exception>
    public void Reject()
    {
        if (Status == FreelancerApplicationStatus.Rejected)
            return; // Idempotent

        if (Status != FreelancerApplicationStatus.Pending)
        {
            throw new DomainException(
                "Can only reject a pending application",
                "APPLICATION_NOT_PENDING");
        }

        Status = FreelancerApplicationStatus.Rejected;
        UpdatedAt = DateTime.UtcNow;
    }

    // ====================================================================
    // QUERY METHODS - No side effects
    // ====================================================================

    /// <summary>
    /// Indicates if the application is in Pending status.
    /// </summary>
    public bool IsPending() => Status == FreelancerApplicationStatus.Pending;

    /// <summary>
    /// Indicates if the application has been accepted.
    /// </summary>
    public bool IsAccepted() => Status == FreelancerApplicationStatus.Accepted;

    /// <summary>
    /// Indicates if the application has been rejected.
    /// </summary>
    public bool IsRejected() => Status == FreelancerApplicationStatus.Rejected;

    /// <summary>
    /// Indicates if the application is in a finalized state (Accepted or Rejected).
    /// </summary>
    public bool IsFinalized() => Status == FreelancerApplicationStatus.Accepted ||
                                 Status == FreelancerApplicationStatus.Rejected;

    /// <summary>
    /// Indicates if the application can be accepted.
    /// </summary>
    /// <param name="serviceRequest">The ServiceRequest to validate against</param>
    public bool CanBeAccepted(ServiceRequest serviceRequest)
    {
        return Status == FreelancerApplicationStatus.Pending &&
               serviceRequest.CanAcceptApplications() &&
               serviceRequest.Id == ServiceRequestId;
    }

    /// <summary>
    /// Indicates if the application can be rejected.
    /// </summary>
    public bool CanBeRejected() => Status == FreelancerApplicationStatus.Pending;
}