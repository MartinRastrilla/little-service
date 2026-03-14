namespace LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;

public class CreateServiceRequestRequest
{
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public decimal? Price { get; set; }
}
