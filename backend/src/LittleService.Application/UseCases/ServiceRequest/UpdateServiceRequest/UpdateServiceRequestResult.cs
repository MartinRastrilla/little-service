using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;

public class UpdateServiceRequestResult
{
    public ServiceRequestDetailDto ServiceRequest { get; set; } = null!;
}
