namespace LittleService.Application.UseCases.Service.UpdateService;

public class UpdateServiceRequest
{
    public string? Title { get; set; }
    public string? Description { get; set; }
    public decimal? Price { get; set; }
    public bool? IsActive { get; set; }
}
