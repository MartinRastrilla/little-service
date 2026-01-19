namespace LittleService.Application.UseCases.Client.UpdateClient;

public class UpdateClientCommand
{
    public Guid UserId { get; set; }
    public string? Name { get; set; }
    public Stream? ProfilePicture { get; set; }
    public string? ProfilePictureFileName { get; set; }
}