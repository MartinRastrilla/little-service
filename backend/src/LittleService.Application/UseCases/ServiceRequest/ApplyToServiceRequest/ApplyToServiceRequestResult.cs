using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.ApplyToServiceRequest;

public class ApplyToServiceRequestResult
{
    public FreelancerApplicationSummaryDto Application { get; set; } = null!;
}
