using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;

public class CreateServiceRequestResult
{
    public ServiceRequestDetailDto ServiceRequest { get; set; } = null!;
}
