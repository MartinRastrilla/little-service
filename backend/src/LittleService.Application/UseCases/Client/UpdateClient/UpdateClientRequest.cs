namespace LittleService.Application.UseCases.Client.UpdateClient;

public class UpdateClientRequest
{
    public string? Name { get; set; }
    public string? Address { get; set; }
    public Stream? ProfilePicture { get; set; }
    public string? ProfilePictureFileName { get; set; }
}
