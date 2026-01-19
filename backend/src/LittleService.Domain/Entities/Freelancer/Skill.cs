namespace LittleService.Domain.Entities;

public class Skill : BaseEntity
{
    public string Name { get; set; } = null!;

    /* === Relationships === */
    public ICollection<FreelancerSkill> FreelancerSkills { get; set; } = new List<FreelancerSkill>();
}