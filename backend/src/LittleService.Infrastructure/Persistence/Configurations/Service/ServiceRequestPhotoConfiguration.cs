using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class ServiceRequestPhotoConfiguration : IEntityTypeConfiguration<ServiceRequestPhoto>
{
    public void Configure(EntityTypeBuilder<ServiceRequestPhoto> builder)
    {
        builder.HasKey(p => p.Id);

        builder.Property(p => p.FilePath)
            .IsRequired()
            .HasMaxLength(500);

        builder.Property(p => p.CreatedAt)
            .IsRequired();

        builder.Property(p => p.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(p => p.ServiceRequest)
            .WithMany(sr => sr.Photos)
            .HasForeignKey(p => p.ServiceRequestId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}

