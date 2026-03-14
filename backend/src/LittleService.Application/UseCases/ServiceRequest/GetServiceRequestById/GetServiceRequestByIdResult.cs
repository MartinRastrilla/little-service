using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestById;

public class GetServiceRequestByIdResult
{
    public ServiceRequestDetailDto ServiceRequest { get; set; } = null!;
}
