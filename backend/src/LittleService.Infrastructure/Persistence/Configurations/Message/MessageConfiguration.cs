using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class MessageConfiguration : IEntityTypeConfiguration<Message>
{
    public void Configure(EntityTypeBuilder<Message> builder)
    {
        builder.HasKey(m => m.Id);

        builder.Property(m => m.Content)
            .IsRequired()
            .HasMaxLength(2000);

        builder.Property(m => m.IsRead)
            .IsRequired()
            .HasDefaultValue(false);

        builder.Property(m => m.CreatedAt)
            .IsRequired();

        builder.Property(m => m.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(m => m.FromUser)
            .WithMany(u => u.Messages)
            .HasForeignKey(m => m.FromUserId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(m => m.ToUser)
            .WithMany()
            .HasForeignKey(m => m.ToUserId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(m => m.ServiceRequest)
            .WithMany(sr => sr.Messages)
            .HasForeignKey(m => m.ServiceRequestId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}

