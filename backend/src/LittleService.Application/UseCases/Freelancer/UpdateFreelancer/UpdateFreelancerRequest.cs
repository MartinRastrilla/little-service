namespace LittleService.Application.UseCases.Freelancer.UpdateFreelancer;

public class UpdateFreelancerRequest
{
    public string? Name { get; set; }
    public string? Bio { get; set; }
    public string? Profession { get; set; }
    public Stream? ProfilePicture { get; set; }
    public string? ProfilePictureFileName { get; set; }
}
