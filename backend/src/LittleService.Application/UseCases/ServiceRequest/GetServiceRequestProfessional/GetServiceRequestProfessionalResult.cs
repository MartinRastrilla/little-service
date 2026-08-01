using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetServiceRequestProfessional;

public class GetServiceRequestProfessionalResult
{
    public ServiceRequestProfessionalDto Professional { get; set; } = new();
}
