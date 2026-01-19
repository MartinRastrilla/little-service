using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class RatingConfiguration : IEntityTypeConfiguration<Rating>
{
    public void Configure(EntityTypeBuilder<Rating> builder)
    {
        builder.HasKey(r => r.Id);

        //? Basic Properties
        builder.Property(r => r.Score)
            .IsRequired();

        builder.Property(r => r.Comment)
            .IsRequired(false)
            .HasMaxLength(1000);

        builder.Property(r => r.CreatedAt)
            .IsRequired();

        builder.Property(r => r.UpdatedAt)
            .IsRequired(false);

        //? Moderation Properties
        builder.Property(r => r.IsActive)
            .IsRequired()
            .HasDefaultValue(true);

        builder.Property(r => r.EditCountWhileDeactivated)
            .IsRequired()
            .HasDefaultValue(0);

        builder.Property(r => r.DeactivatedAt)
            .IsRequired(false);

        builder.Property(r => r.DeactivatedById)
            .IsRequired(false);

        builder.Property(r => r.ReceiverRole)
            .IsRequired()
            .HasConversion<int>();

        //? Relationships
        builder.HasOne(r => r.ServiceRequest)
            .WithMany(sr => sr.Ratings)
            .HasForeignKey(r => r.ServiceRequestId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.UserReviewee)
            .WithMany(u => u.Ratings)
            .HasForeignKey(r => r.UserRevieweeId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.UserReviewer)
            .WithMany()
            .HasForeignKey(r => r.UserReviewerId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.DeactivatedBy)
            .WithMany()
            .HasForeignKey(r => r.DeactivatedById)
            .OnDelete(DeleteBehavior.Restrict);

        //? Indexes
        // Index for queries filtering by user and receiver role
        builder.HasIndex(r => new { r.UserRevieweeId, r.ReceiverRole, r.IsActive });

        // Unique index to prevent duplicate ratings (same reviewer, same service request, same receiver role)
        builder.HasIndex(r => new { r.ServiceRequestId, r.UserReviewerId, r.ReceiverRole })
            .IsUnique();
    }
}

