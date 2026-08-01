using System.Diagnostics.Contracts;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class ServiceRequest : BaseEntity
{
    public string Title { get; private set; } = null!;
    public string Description { get; private set; } = null!;
    public string Location { get; private set; } = null!;

    public Guid ClientId { get; private set; }
    public Client Client { get; private set; } = null!;

    public Guid? FreelancerPickedId { get; private set; }
    public Freelancer? FreelancerPicked { get; private set; }

    public decimal? Price { get; private set; }
    public ServiceRequestStatus Status { get; private set; } = ServiceRequestStatus.Opened;
    public Contract? Contract { get; private set; }

    public ICollection<ServiceRequestPhoto> Photos { get; private set; } = new List<ServiceRequestPhoto>();
    public ICollection<FreelancerApplication> FreelancerApplications { get; private set; } = new List<FreelancerApplication>();
    public ICollection<Message> Messages { get; private set; } = new List<Message>();
    public ICollection<Rating> Ratings { get; private set; } = new List<Rating>();
    public ICollection<Report> Reports { get; private set; } = new List<Report>();

    private ServiceRequest() { }

    // ====================================================================
    // FACTORY METHOD - Creation of ServiceRequest
    // ====================================================================

    /// <summary>
    /// Creates a new ServiceRequest. Only can be created by a Client.
    /// </summary>
    /// <param name="title">Title of the service requested</param>
    /// <param name="description">Detailed description of the service</param>
    /// <param name="location">Location where the service will be performed</param>
    /// <param name="clientId">ID of the Client that creates the request</param>
    /// <param name="price">Optional price of the service</param>
    /// <returns>New instance of ServiceRequest in state Opened</returns>
    /// <exception cref="DomainException">If the validations fail</exception>
    public static ServiceRequest Create(
        string title,
        string description,
        string location,
        Guid clientId,
        decimal? price = null
    )
    {
        //? Validations
        ValidateTitle(title);
        ValidateDescription(description);
        ValidateLocation(location);

        if (price.HasValue)
        {
            ValidatePrice(price.Value);
        }

        var serviceRequest = new ServiceRequest
        {
            Id = Guid.NewGuid(),
            Title = title.Trim(),
            Description = description.Trim(),
            Location = location.Trim(),
            ClientId = clientId,
            Price = price,
            Status = ServiceRequestStatus.Opened,
            CreatedAt = DateTime.UtcNow
        };

        return serviceRequest;
    }

    // ====================================================================
    // BUSINESS METHODS - Modification of data
    // ====================================================================

    /// <summary>
    /// Updates the basic details of the ServiceRequest.
    /// Only can be updated if it is in state Opened.
    /// </summary>
    public void UpdateDetails(string title, string description, string location)
    {
        EnsureIsEditable();

        ValidateTitle(title);
        ValidateDescription(description);
        ValidateLocation(location);

        Title = title.Trim();
        Description = description.Trim();
        Location = location.Trim();
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Sets the price of the service.
    /// Can be set only if it is in state Opened.
    /// </summary>
    public void SetPrice(decimal price)
    {
        EnsureIsEditable();

        ValidatePrice(price);
        Price = price;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Updates the price of the service.
    /// Can be updated only if it is in state Opened.
    /// </summary>
    public void UpdatePrice(decimal newPrice)
    {
        EnsureIsEditable();

        SetPrice(newPrice);
    }

    /// <summary>
    /// Clears the price so the service request uses "price to be agreed".
    /// </summary>
    public void ClearPrice()
    {
        EnsureIsEditable();
        Price = null;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Removes a photo from the service request.
    /// </summary>
    public ServiceRequestPhoto RemovePhoto(Guid photoId)
    {
        EnsureIsEditable();

        var photo = Photos.FirstOrDefault(p => p.Id == photoId);
        if (photo == null)
        {
            throw new DomainException(
                "La foto no pertenece a este pedido",
                "PHOTO_NOT_FOUND");
        }

        Photos.Remove(photo);
        UpdatedAt = DateTime.UtcNow;
        return photo;
    }

    /// <summary>
    /// Adds a photo to the service request.
    /// </summary>
    public ServiceRequestPhoto AddPhoto(string filePath)
    {
        EnsureIsEditable();

        var photo = ServiceRequestPhoto.Create(Id, filePath);
        Photos.Add(photo);
        UpdatedAt = DateTime.UtcNow;
        return photo;
    }

    /// <summary>
    /// Assigns a Freelancer to the ServiceRequest.
    /// Can be assigned if it is Opened and does not have a freelancer assigned.
    /// When assigning a freelancer, the request stops accepting applications.
    /// </summary>
    public void AssignFreelancer(Guid freelancerId)
    {
        if (Status != ServiceRequestStatus.Opened)
        {
            throw new DomainException(
                "Solo se puede asignar un freelancer a un ServiceRequest abierto",
                "SERVICE_REQUEST_NOT_OPENED");
        }

        if (FreelancerPickedId.HasValue)
        {
            throw new DomainException(
                "Ya hay un freelancer asignado a este ServiceRequest",
                "FREELANCER_ALREADY_ASSIGNED");
        }

        FreelancerPickedId = freelancerId;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Cancels the ServiceRequest when it is Opened and there is no active contract.
    /// Rejects all pending freelancer applications.
    /// </summary>
    public void Cancel(Contract? contract, IEnumerable<FreelancerApplication> applications)
    {
        if (Status == ServiceRequestStatus.Cancelled)
        {
            return;
        }

        if (Status != ServiceRequestStatus.Opened)
        {
            throw new DomainException(
                "Solo se puede cancelar un pedido abierto",
                "SERVICE_REQUEST_NOT_OPENED");
        }

        if (contract != null && !contract.IsCancelled() && !contract.IsCompleted())
        {
            throw new DomainException(
                "Tenés un contrato en curso con este pedido. Para cancelarlo, primero cancelá el contrato vigente.",
                "ACTIVE_CONTRACT_BLOCKS_CANCEL");
        }

        foreach (var application in applications.Where(a => a.IsPending()))
        {
            application.Reject();
        }

        Status = ServiceRequestStatus.Cancelled;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Closes the ServiceRequest.
    /// Can be closed if it has the final Freelancer assigned.
    /// Once closed, it cannot be reopened or modified.
    /// </summary>
    public void Close()
    {
        if (Status == ServiceRequestStatus.Closed)
        {
            return; // Idempotente
        }

        if (Status == ServiceRequestStatus.Cancelled)
        {
            throw new DomainException(
                "No se puede cerrar un ServiceRequest cancelado",
                "SERVICE_REQUEST_CANCELLED");
        }

        if (FreelancerPickedId == null)
        {
            throw new DomainException(
                "No se puede cerrar un ServiceRequest sin un freelancer asignado",
                "FREELANCER_NOT_ASSIGNED");
        }

        Status = ServiceRequestStatus.Closed;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Reopens the ServiceRequest so it can receive applications again.
    /// </summary>
    public void ReopenForApplications()
    {
        if (Status == ServiceRequestStatus.Opened)
            return;

        if (Status == ServiceRequestStatus.Cancelled)
        {
            throw new DomainException(
                "No se puede reabrir un pedido cancelado",
                "SERVICE_REQUEST_CANCELLED");
        }

        if (FreelancerPickedId.HasValue)
        {
            throw new DomainException(
                "No se puede reabrir un pedido con un profesional asignado",
                "FREELANCER_ALREADY_ASSIGNED");
        }

        Status = ServiceRequestStatus.Opened;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Revokes the assigned professional and returns the service request to the applications phase.
    /// </summary>
    public void RevokeEngagement(Contract? contract, FreelancerApplication acceptedApplication)
    {
        if (Status == ServiceRequestStatus.Cancelled)
        {
            throw new DomainException(
                "No podés modificar la contratación de un pedido cancelado.",
                "SERVICE_REQUEST_CANCELLED");
        }

        if (!FreelancerPickedId.HasValue)
        {
            throw new DomainException(
                "Este pedido no tiene un profesional asignado.",
                "NO_ASSIGNED_PROFESSIONAL");
        }

        if (contract != null && !contract.IsDraft() && !contract.IsCancelled())
        {
            throw new DomainException(
                "Tenés un contrato en curso. Para cambiar de profesional, primero cancelá el contrato vigente.",
                "ACTIVE_CONTRACT_BLOCKS_REVOKE_ENGAGEMENT");
        }

        if (!acceptedApplication.IsAccepted())
        {
            throw new DomainException(
                "La postulación del profesional no está aceptada",
                "APPLICATION_NOT_ACCEPTED");
        }

        if (acceptedApplication.FreelancerId != FreelancerPickedId.Value)
        {
            throw new DomainException(
                "La postulación no corresponde al profesional asignado",
                "APPLICATION_FREELANCER_MISMATCH");
        }

        if (acceptedApplication.ServiceRequestId != Id)
        {
            throw new DomainException(
                "La postulación no corresponde a este pedido",
                "SERVICE_REQUEST_MISMATCH");
        }

        acceptedApplication.RevokeAcceptance();
        FreelancerPickedId = null;
        ReopenForApplications();
    }

    // ====================================================================
    // QUERY METHODS - Without side effects
    // ====================================================================

    /// <summary>
    /// Indicates if the ServiceRequest can receive new applications from freelancers.
    /// </summary>
    public bool CanAcceptApplications()
    {
        return Status == ServiceRequestStatus.Opened &&
               !FreelancerPickedId.HasValue;
    }

    /// <summary>
    /// Indicates if the ServiceRequest can be edited.
    /// </summary>
    public bool IsEditable()
    {
        return Status == ServiceRequestStatus.Opened;
    }

    /// <summary>
    /// Indicates if a freelancer can be assigned.
    /// </summary>
    public bool CanAssignFreelancer()
    {
        return Status == ServiceRequestStatus.Opened &&
               !FreelancerPickedId.HasValue;
    }

    /// <summary>
    /// Indicates if the ServiceRequest is open.
    /// </summary>
    public bool IsOpen()
    {
        return Status == ServiceRequestStatus.Opened;
    }

    /// <summary>
    /// Indicates if the ServiceRequest is cancelled.
    /// </summary>
    public bool IsCancelled()
    {
        return Status == ServiceRequestStatus.Cancelled;
    }

    /// <summary>
    /// Indicates if the ServiceRequest is closed.
    /// </summary>
    public bool IsClosed()
    {
        return Status == ServiceRequestStatus.Closed;
    }

    /// <summary>
    /// Indicates if the ServiceRequest has a freelancer assigned.
    /// </summary>
    public bool HasFreelancerAssigned()
    {
        return FreelancerPickedId.HasValue;
    }

    /// <summary>
    /// Indicates if the ServiceRequest has a contract associated.
    /// </summary>
    public bool HasContract()
    {
        return Contract != null;
    }

    /// <summary>
    /// Indicates if the client can cancel this service request.
    /// </summary>
    public bool CanBeCancelled(Contract? contract)
    {
        if (Status != ServiceRequestStatus.Opened)
            return false;

        if (contract != null && !contract.IsCancelled() && !contract.IsCompleted())
            return false;

        return true;
    }

    /// <summary>
    /// Returns a user-friendly reason when cancellation is blocked, or null if allowed.
    /// </summary>
    public string? GetCancelBlockedReason(Contract? contract)
    {
        if (Status == ServiceRequestStatus.Cancelled)
            return null;

        if (Status != ServiceRequestStatus.Opened)
            return "Solo podés cancelar pedidos que siguen abiertos.";

        if (contract != null && !contract.IsCancelled() && !contract.IsCompleted())
        {
            return "Tenés un contrato en curso con este pedido. Para cancelarlo, primero cancelá el contrato vigente.";
        }

        return null;
    }

    /// <summary>
    /// Indicates if the client can revoke the assigned professional.
    /// </summary>
    public bool CanRevokeEngagement(Contract? contract)
    {
        if (Status == ServiceRequestStatus.Cancelled)
            return false;

        if (!FreelancerPickedId.HasValue)
            return false;

        if (contract != null && !contract.IsDraft() && !contract.IsCancelled())
            return false;

        return true;
    }

    /// <summary>
    /// Returns a user-friendly reason when revoking engagement is blocked, or null if allowed.
    /// </summary>
    public string? GetRevokeEngagementBlockedReason(Contract? contract)
    {
        if (Status == ServiceRequestStatus.Cancelled)
            return "No podés modificar la contratación de un pedido cancelado.";

        if (!FreelancerPickedId.HasValue)
            return "Este pedido no tiene un profesional asignado.";

        if (contract != null && !contract.IsDraft() && !contract.IsCancelled())
        {
            return "Tenés un contrato en curso. Para cambiar de profesional, primero cancelá el contrato vigente.";
        }

        return null;
    }

    /// <summary>
    /// Returns a user-friendly reason when editing is blocked, or null if editable.
    /// </summary>
    public string? GetEditBlockedReason()
    {
        if (IsEditable())
            return null;

        return Status switch
        {
            ServiceRequestStatus.Closed =>
                "No podés editar un pedido que ya tiene un profesional asignado.",
            ServiceRequestStatus.Cancelled =>
                "Este pedido fue cancelado y ya no se puede modificar.",
            _ => "Este pedido ya no se puede modificar.",
        };
    }

    // ====================================================================
    // PRIVATE METHODS - Validations and helpers
    // ====================================================================

    /// <summary>
    /// Ensures that the ServiceRequest is in an editable state.
    /// </summary>
    private void EnsureIsEditable()
    {
        if (!IsEditable())
        {
            throw new DomainException(
                $"No se puede modificar un ServiceRequest en estado {Status}",
                "SERVICE_REQUEST_NOT_EDITABLE");
        }
    }

    /// <summary>
    /// Validates the title of the ServiceRequest.
    /// </summary>
    private static void ValidateTitle(string title)
    {
        if (string.IsNullOrWhiteSpace(title))
        {
            throw new DomainException(
                "El título es requerido",
                "TITLE_REQUIRED");
        }

        if (title.Trim().Length > 200)
        {
            throw new DomainException(
                "El título no puede exceder 200 caracteres",
                "TITLE_TOO_LONG");
        }
    }

    /// <summary>
    /// Validates the description of the ServiceRequest.
    /// </summary>
    private static void ValidateDescription(string description)
    {
        if (string.IsNullOrWhiteSpace(description))
        {
            throw new DomainException(
                "La descripción es requerida",
                "DESCRIPTION_REQUIRED");
        }

        if (description.Trim().Length > 2000)
        {
            throw new DomainException(
                "La descripción no puede exceder 2000 caracteres",
                "DESCRIPTION_TOO_LONG");
        }
    }

    /// <summary>
    /// Validates the location of the ServiceRequest.
    /// </summary>
    private static void ValidateLocation(string location)
    {
        if (string.IsNullOrWhiteSpace(location))
        {
            throw new DomainException(
                "La ubicación es requerida",
                "LOCATION_REQUIRED");
        }

        if (location.Trim().Length > 500)
        {
            throw new DomainException(
                "La ubicación no puede exceder 500 caracteres",
                "LOCATION_TOO_LONG");
        }
    }

    /// <summary>
    /// Validates that the price is positive.
    /// </summary>
    private static void ValidatePrice(decimal price)
    {
        if (price <= 0)
        {
            throw new DomainException(
                "El precio debe ser mayor a cero",
                "INVALID_PRICE");
        }

        if (price > 999999999.99m) // Reasonable limit for decimal(18,2)
        {
            throw new DomainException(
                "El precio excede el límite permitido",
                "PRICE_TOO_HIGH");
        }
    }
}