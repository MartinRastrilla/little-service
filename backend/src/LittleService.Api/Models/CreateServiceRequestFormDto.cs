namespace LittleService.Api.Models;

public class CreateServiceRequestFormDto
{
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Location { get; set; } = string.Empty;
    public decimal? Price { get; set; }
    public IList<IFormFile>? Photos { get; set; }
}