using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestInfo;

public class GetServiceRequestInfoResult
{
    public ServiceRequestInfoDto ServiceRequest { get; set; } = null!;
}
