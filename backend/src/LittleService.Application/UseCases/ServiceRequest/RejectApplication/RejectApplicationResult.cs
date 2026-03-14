using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.RejectApplication;

public class RejectApplicationResult
{
    public FreelancerApplicationSummaryDto Application { get; set; } = null!;
}
