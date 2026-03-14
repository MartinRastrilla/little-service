namespace LittleService.Application.UseCases.ServiceRequest.CancelServiceRequest;

public class CancelServiceRequestResult
{
    public Guid ServiceRequestId { get; set; }
    public string Status { get; set; } = string.Empty;
}
