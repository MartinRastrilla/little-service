using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.CancelServiceRequestEngagement;

public class CancelServiceRequestEngagementResult
{
    public ServiceRequestProfessionalDto Professional { get; set; } = new();
}
