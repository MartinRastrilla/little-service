using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class FreelancerSkillConfiguration : IEntityTypeConfiguration<FreelancerSkill>
{
    public void Configure(EntityTypeBuilder<FreelancerSkill> builder)
    {
        builder.HasKey(fs => fs.Id);

        builder.HasIndex(fs => new { fs.FreelancerId, fs.SkillId })
            .IsUnique();

        builder.Property(fs => fs.CreatedAt)
            .IsRequired();

        builder.Property(fs => fs.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(fs => fs.Freelancer)
            .WithMany(f => f.FreelancerSkills)
            .HasForeignKey(fs => fs.FreelancerId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(fs => fs.Skill)
            .WithMany(s => s.FreelancerSkills)
            .HasForeignKey(fs => fs.SkillId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}

