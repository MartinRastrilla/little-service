namespace LittleService.Application.DTOs.ServiceRequests;

public class ServiceRequestProfessionalDto
{
    public bool HasAssignedProfessional { get; set; }
    public Guid? FreelancerId { get; set; }
    public string ServiceLocation { get; set; } = string.Empty;
    public string DisplayStatus { get; set; } = string.Empty;
    public DateTime? SelectedAt { get; set; }
    public ServiceRequestContractSummaryDto ContractSummary { get; set; } = new();
    public ServiceRequestProfessionalActionsDto Actions { get; set; } = new();
}

public class ServiceRequestContractSummaryDto
{
    public bool HasContract { get; set; }
    public DateTime? StartDate { get; set; }
    public decimal? Amount { get; set; }
    public string? Status { get; set; }
    public string? DisplayStatus { get; set; }
}

public class ServiceRequestProfessionalActionsDto
{
    public bool CanRevokeEngagement { get; set; }
    public string? RevokeEngagementBlockedReason { get; set; }
    public bool CanOpenProfile { get; set; }

    // TODO(professional-tab): chat integration
    public bool CanOpenChat { get; set; }

    // TODO(professional-tab): phone field on User + call flow
    public bool CanCall { get; set; }

    // TODO(professional-tab): contract viewer screen/PDF
    public bool CanViewContract { get; set; }
}
