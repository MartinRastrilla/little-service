using LittleService.Application.DTOs.Common;
using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetMyServiceRequests;

public class GetMyServiceRequestsResult
{
    public PagedResultDto<ServiceRequestSummaryDto> ServiceRequests { get; set; } = new();
}
