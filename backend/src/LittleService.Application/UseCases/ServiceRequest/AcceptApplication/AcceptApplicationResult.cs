using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.AcceptApplication;

public class AcceptApplicationResult
{
    public FreelancerApplicationSummaryDto Application { get; set; } = null!;
}
