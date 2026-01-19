using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class FreelancerApplicationConfiguration : IEntityTypeConfiguration<FreelancerApplication>
{
    public void Configure(EntityTypeBuilder<FreelancerApplication> builder)
    {
        builder.HasKey(fa => fa.Id);

        builder.Property(fa => fa.Status)
            .IsRequired()
            .HasConversion<int>();

        builder.Property(fa => fa.CreatedAt)
            .IsRequired();

        builder.Property(fa => fa.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(fa => fa.ServiceRequest)
            .WithMany(sr => sr.FreelancerApplications)
            .HasForeignKey(fa => fa.ServiceRequestId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(fa => fa.Freelancer)
            .WithMany(f => f.FreelancerApplications)
            .HasForeignKey(fa => fa.FreelancerId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}

