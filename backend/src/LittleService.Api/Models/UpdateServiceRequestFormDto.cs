namespace LittleService.Api.Models;

public class UpdateServiceRequestFormDto
{
    public string? Title { get; set; }
    public string? Description { get; set; }
    public string? Location { get; set; }
    public decimal? Price { get; set; }
    public bool ClearPrice { get; set; }
    public string? DeletedPhotoIds { get; set; }
    public IList<IFormFile>? Photos { get; set; }
}
