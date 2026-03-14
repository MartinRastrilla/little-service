using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;

public class GetMyServiceRequestsResult
{
    public IList<ServiceRequestSummaryDto> ServiceRequests { get; set; } = new List<ServiceRequestSummaryDto>();
}
