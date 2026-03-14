using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequests;

public class GetOpenServiceRequestsResult
{
    public IList<ServiceRequestSummaryDto> ServiceRequests { get; set; } = new List<ServiceRequestSummaryDto>();
}
