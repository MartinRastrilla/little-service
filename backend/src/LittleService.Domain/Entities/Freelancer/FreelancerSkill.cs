namespace LittleService.Domain.Entities;

public class FreelancerSkill : BaseEntity
{
    public Guid FreelancerId { get; set; }
    public Freelancer Freelancer { get; set; } = null!;

    public Guid SkillId { get; set; }
    public Skill Skill { get; set; } = null!;
}