using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class Contract : BaseEntity
{
    public Guid ServiceRequestId { get; private set; }
    public ServiceRequest ServiceRequest { get; private set; } = null!;

    public string Terms { get; private set; } = null!;

    public DateTime StartDate { get; private set; }
    public DateTime EndDate { get; private set; }

    public ContractStatus Status { get; private set; } = ContractStatus.Draft;

    public DateTime? SignedByClientAt { get; private set; }
    public DateTime? SignedByFreelancerAt { get; private set; }

    public decimal Amount { get; private set; }

    /* === Relationships === */
    public ICollection<ContractPayment> ContractPayments { get; private set; } = new List<ContractPayment>();

    private Contract() { }

    // Factory Method - Creation of Contract
    public static Contract Create(
        Guid serviceRequestId,
        string terms,
        DateTime startDate,
        DateTime endDate,
        decimal amount)
    {
        //? Validations
        ValidateTerms(terms);
        ValidateDates(startDate, endDate);
        ValidateAmount(amount);

        var contract = new Contract
        {
            Id = Guid.NewGuid(),
            ServiceRequestId = serviceRequestId,
            Terms = terms.Trim(),
            StartDate = startDate,
            EndDate = endDate,
            Amount = amount,
            Status = ContractStatus.Draft,
            CreatedAt = DateTime.UtcNow
        };

        return contract;
    }

    // Business Methods - Modification of data
    public void UpdateDetails(string terms, DateTime startDate, DateTime endDate, decimal amount)
    {
        EnsureIsDraft();
        ValidateTerms(terms);
        ValidateDates(startDate, endDate);
        ValidateAmount(amount);

        Terms = terms.Trim();
        StartDate = startDate;
        EndDate = endDate;
        Amount = amount;
        UpdatedAt = DateTime.UtcNow;
    }

    public void UpdateTerms(string terms)
    {
        EnsureIsDraft();
        ValidateTerms(terms);
        Terms = terms.Trim();
        UpdatedAt = DateTime.UtcNow;
    }

    public void UpdateDates(DateTime startDate, DateTime endDate)
    {
        EnsureIsDraft();
        ValidateDates(startDate, endDate);
        StartDate = startDate;
        EndDate = endDate;
        UpdatedAt = DateTime.UtcNow;
    }

    public void UpdateAmount(decimal amount)
    {
        EnsureIsDraft();
        ValidateAmount(amount);
        Amount = amount;
        UpdatedAt = DateTime.UtcNow;
    }

    //? Sign methods
    public void SignByClient()
    {
        if (SignedByClientAt.HasValue)
            throw new DomainException("El contrato ya está firmado por el cliente", "ALREADY_SIGNED_BY_CLIENT");

        if (Status == ContractStatus.Signed || Status == ContractStatus.Completed)
            throw new DomainException("No se puede firmar un contrato que ya está firmado o completado", "CONTRACT_ALREADY_SIGNED");

        if (Status == ContractStatus.Cancelled)
            throw new DomainException("No se puede firmar un contrato cancelado", "CONTRACT_CANCELLED");

        SignedByClientAt = DateTime.UtcNow;

        if (Status == ContractStatus.Draft)
            Status = ContractStatus.SignedByClient;
        else if (Status == ContractStatus.SignedByFreelancer)
            Status = ContractStatus.Signed;

        UpdatedAt = DateTime.UtcNow;
    }

    public void SignByFreelancer()
    {
        if (SignedByFreelancerAt.HasValue)
            throw new DomainException("El contrato ya está firmado por el freelancer", "ALREADY_SIGNED_BY_FREELANCER");

        if (Status == ContractStatus.Signed || Status == ContractStatus.Completed)
            throw new DomainException("No se puede firmar un contrato que ya está firmado o completado", "CONTRACT_ALREADY_SIGNED");

        if (Status == ContractStatus.Cancelled)
            throw new DomainException("No se puede firmar un contrato cancelado", "CONTRACT_CANCELLED");

        SignedByFreelancerAt = DateTime.UtcNow;

        if (Status == ContractStatus.Draft)
            Status = ContractStatus.SignedByFreelancer;
        else if (Status == ContractStatus.SignedByClient)
            Status = ContractStatus.Signed;

        UpdatedAt = DateTime.UtcNow;
    }

    //? Status methods
    public void Cancel()
    {
        if (Status == ContractStatus.Cancelled)
            return; // Idempotent

        if (Status == ContractStatus.Signed)
            throw new DomainException("No se puede cancelar un contrato que ya está firmado", "CONTRACT_SIGNED");

        if (Status == ContractStatus.Completed)
            throw new DomainException("No se puede cancelar un contrato completado", "CONTRACT_COMPLETED");

        Status = ContractStatus.Cancelled;
        UpdatedAt = DateTime.UtcNow;
    }

    public void Complete()
    {
        if (Status == ContractStatus.Completed)
            return; // Idempotent

        if (Status != ContractStatus.Signed)
            throw new DomainException("No se puede completar un contrato que no está firmado", "CONTRACT_NOT_SIGNED");

        Status = ContractStatus.Completed;
        UpdatedAt = DateTime.UtcNow;

        // Update metrics when contract is completed for the first time
        // Update Freelancer completed jobs count
        if (ServiceRequest?.FreelancerPicked != null)
        {
            ServiceRequest.FreelancerPicked.IncrementCompletedJobs();
        }

        // Update Client total contracts count
        if (ServiceRequest?.Client != null)
        {
            ServiceRequest.Client.IncrementTotalContracts();
        }
    }

    //? Query methods
    public bool IsDraft() => Status == ContractStatus.Draft;
    public bool IsSignedByClient() => SignedByClientAt.HasValue;
    public bool IsSignedByFreelancer() => SignedByFreelancerAt.HasValue;
    public bool IsSigned() => Status == ContractStatus.Signed || Status == ContractStatus.Completed;
    public bool IsCompleted() => Status == ContractStatus.Completed;
    public bool IsCancelled() => Status == ContractStatus.Cancelled;
    public bool CanBeEdited() => Status == ContractStatus.Draft;
    public bool CanBeCancelled() => Status != ContractStatus.Signed && Status != ContractStatus.Completed && Status != ContractStatus.Cancelled;
    public bool CanBeCompleted() => Status == ContractStatus.Signed;
    public bool CanBeSignedByClient() => (Status == ContractStatus.Draft || Status == ContractStatus.SignedByFreelancer) && !SignedByClientAt.HasValue;
    public bool CanBeSignedByFreelancer() => (Status == ContractStatus.Draft || Status == ContractStatus.SignedByClient) && !SignedByFreelancerAt.HasValue;

    //? Private validations
    private void EnsureIsDraft()
    {
        if (Status != ContractStatus.Draft)
            throw new DomainException($"No se puede editar un contrato en estado {Status}", "CONTRACT_NOT_DRAFT");
    }

    private static void ValidateTerms(string terms)
    {
        if (string.IsNullOrWhiteSpace(terms))
            throw new DomainException("Los términos del contrato son requeridos", "TERMS_REQUIRED");

        if (terms.Trim().Length > 5000)
            throw new DomainException("Los términos del contrato no pueden exceder 5000 caracteres", "TERMS_TOO_LONG");
    }

    private static void ValidateDates(DateTime startDate, DateTime endDate)
    {
        if (endDate <= startDate)
            throw new DomainException("La fecha de fin debe ser mayor a la fecha de inicio", "INVALID_DATE_RANGE");
    }

    private static void ValidateAmount(decimal amount)
    {
        if (amount <= 0)
            throw new DomainException("El monto del contrato debe ser mayor a cero", "INVALID_AMOUNT");

        if (amount > 999999999.99m)
            throw new DomainException("El monto del contrato excede el máximo permitido", "AMOUNT_TOO_HIGH");
    }
}
