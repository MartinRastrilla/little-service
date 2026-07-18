using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestActivity;

public class GetServiceRequestActivityResult
{
    public ServiceRequestActivityDto Activity { get; set; } = null!;
}
