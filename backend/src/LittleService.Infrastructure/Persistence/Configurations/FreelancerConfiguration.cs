using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class FreelancerConfiguration : IEntityTypeConfiguration<Freelancer>
{
    public void Configure(EntityTypeBuilder<Freelancer> builder)
    {
        builder.HasKey(f => f.UserId);

        builder.Property(f => f.Bio)
            .IsRequired(false)
            .HasMaxLength(2000);

        builder.Property(f => f.RatingAverage)
            .IsRequired()
            .HasDefaultValue(0);

        builder.Property(f => f.RatingCount)
            .IsRequired()
            .HasDefaultValue(0);

        builder.Property(f => f.CompletedJobs)
            .IsRequired()
            .HasDefaultValue(0);

        //? Relationships
        builder.HasOne(f => f.User)
            .WithOne(u => u.Freelancer)
            .HasForeignKey<Freelancer>(f => f.UserId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasMany(f => f.Services)
            .WithOne(s => s.Freelancer)
            .HasForeignKey(s => s.FreelancerId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}