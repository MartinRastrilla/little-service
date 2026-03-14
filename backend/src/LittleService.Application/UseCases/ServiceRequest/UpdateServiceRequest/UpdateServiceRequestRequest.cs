namespace LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;

public class UpdateServiceRequestRequest
{
    public string? Title { get; set; }
    public string? Description { get; set; }
    public string? Location { get; set; }
    public decimal? Price { get; set; }
}
