namespace LittleService.Application.DTOs.Contracts;

public class ContractDto
{
    public Guid Id { get; set; }
    public Guid ServiceRequestId { get; set; }
    public string Terms { get; set; } = string.Empty;
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public decimal Amount { get; set; }
    public string Status { get; set; } = string.Empty;
    public decimal? SuggestedAmount { get; set; }
    public bool CanEdit { get; set; }
    public bool CanSign { get; set; }
    public bool CanCancelPartial { get; set; }
    public DateTime? SignedByClientAt { get; set; }
    public DateTime? SignedByFreelancerAt { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}

public class UpsertContractRequest
{
    public string Terms { get; set; } = string.Empty;
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public decimal Amount { get; set; }
}
