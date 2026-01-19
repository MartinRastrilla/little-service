using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class ContractPaymentConfiguration : IEntityTypeConfiguration<ContractPayment>
{
    public void Configure(EntityTypeBuilder<ContractPayment> builder)
    {
        builder.HasKey(cp => cp.Id);

        builder.Property(cp => cp.CreatedAt)
            .IsRequired();

        builder.Property(cp => cp.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(cp => cp.Contract)
            .WithMany(c => c.ContractPayments)
            .HasForeignKey(cp => cp.ContractId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(cp => cp.Payment)
            .WithMany(p => p.ContractPayments)
            .HasForeignKey(cp => cp.PaymentId)
            .OnDelete(DeleteBehavior.Restrict);

        //? Unique index to prevent duplicate Contract-Payment relationships
        builder.HasIndex(cp => new { cp.ContractId, cp.PaymentId })
            .IsUnique();
    }
}

