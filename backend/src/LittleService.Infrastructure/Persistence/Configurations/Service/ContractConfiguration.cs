using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class ContractConfiguration : IEntityTypeConfiguration<Contract>
{
    public void Configure(EntityTypeBuilder<Contract> builder)
    {
        builder.HasKey(c => c.Id);

        builder.Property(c => c.Terms)
            .IsRequired()
            .HasMaxLength(5000);

        builder.Property(c => c.StartDate)
            .IsRequired();

        builder.Property(c => c.EndDate)
            .IsRequired();

        builder.Property(c => c.Status)
            .IsRequired()
            .HasConversion<int>();

        builder.Property(c => c.SignedByClientAt)
            .IsRequired(false);

        builder.Property(c => c.SignedByFreelancerAt)
            .IsRequired(false);

        builder.Property(c => c.Amount)
            .IsRequired()
            .HasPrecision(18, 2);

        builder.Property(c => c.CreatedAt)
            .IsRequired();

        builder.Property(c => c.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(c => c.ServiceRequest)
            .WithOne(sr => sr.Contract)
            .HasForeignKey<Contract>(c => c.ServiceRequestId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasIndex(c => c.ServiceRequestId)
            .IsUnique();

        builder.HasMany(c => c.ContractPayments)
            .WithOne(cp => cp.Contract)
            .HasForeignKey(cp => cp.ContractId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
