using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class ServiceRequestConfiguration : IEntityTypeConfiguration<ServiceRequest>
{
    public void Configure(EntityTypeBuilder<ServiceRequest> builder)
    {
        builder.HasKey(sr => sr.Id);

        builder.Property(sr => sr.Title)
            .IsRequired()
            .HasMaxLength(200);

        builder.Property(sr => sr.Description)
            .IsRequired()
            .HasMaxLength(2000);

        builder.Property(sr => sr.Location)
            .IsRequired()
            .HasMaxLength(500);

        builder.Property(sr => sr.Price)
            .IsRequired(false)
            .HasPrecision(18, 2);

        builder.Property(sr => sr.Status)
            .IsRequired()
            .HasConversion<int>();

        builder.Property(sr => sr.CreatedAt)
            .IsRequired();

        builder.Property(sr => sr.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(sr => sr.Client)
            .WithMany(c => c.ServiceRequests)
            .HasForeignKey(sr => sr.ClientId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(sr => sr.FreelancerPicked)
            .WithMany(f => f.ServiceRequests)
            .HasForeignKey(sr => sr.FreelancerPickedId)
            .OnDelete(DeleteBehavior.SetNull);

        builder.HasMany(sr => sr.Photos)
            .WithOne(p => p.ServiceRequest)
            .HasForeignKey(p => p.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasMany(sr => sr.FreelancerApplications)
            .WithOne(fa => fa.ServiceRequest)
            .HasForeignKey(fa => fa.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasMany(sr => sr.Messages)
            .WithOne(m => m.ServiceRequest)
            .HasForeignKey(m => m.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasMany(sr => sr.Ratings)
            .WithOne(r => r.ServiceRequest)
            .HasForeignKey(r => r.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasMany(sr => sr.Reports)
            .WithOne(r => r.ServiceRequest)
            .HasForeignKey(r => r.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}

