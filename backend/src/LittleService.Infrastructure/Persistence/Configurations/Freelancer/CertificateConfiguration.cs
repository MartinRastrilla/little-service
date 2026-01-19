using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class CertificateConfiguration : IEntityTypeConfiguration<Certificate>
{
    public void Configure(EntityTypeBuilder<Certificate> builder)
    {
        builder.HasKey(c => c.Id);

        builder.Property(c => c.FilePath)
            .IsRequired()
            .HasMaxLength(500);

        builder.Property(c => c.Description)
            .IsRequired(false)
            .HasMaxLength(1000);

        builder.Property(c => c.CreatedAt)
            .IsRequired();

        builder.Property(c => c.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(c => c.Freelancer)
            .WithMany(f => f.Certificates)
            .HasForeignKey(c => c.FreelancerId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}

