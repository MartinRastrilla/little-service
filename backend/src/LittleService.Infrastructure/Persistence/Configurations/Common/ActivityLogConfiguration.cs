using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class ActivityLogConfiguration : IEntityTypeConfiguration<ActivityLog>
{
    public void Configure(EntityTypeBuilder<ActivityLog> builder)
    {
        builder.HasKey(al => al.Id);

        builder.Property(al => al.Action)
            .IsRequired()
            .HasMaxLength(100);

        builder.Property(al => al.Details)
            .IsRequired()
            .HasMaxLength(2000);

        builder.Property(al => al.IpAddress)
            .IsRequired()
            .HasMaxLength(45);

        builder.Property(al => al.CreatedAt)
            .IsRequired();

        builder.Property(al => al.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(al => al.User)
            .WithMany()
            .HasForeignKey(al => al.UserId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}

