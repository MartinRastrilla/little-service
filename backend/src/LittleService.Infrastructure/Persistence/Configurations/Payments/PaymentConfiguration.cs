using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class PaymentConfiguration : IEntityTypeConfiguration<Payment>
{
    public void Configure(EntityTypeBuilder<Payment> builder)
    {
        builder.HasKey(p => p.Id);

        builder.Property(p => p.Amount)
            .IsRequired()
            .HasPrecision(18, 2);

        builder.Property(p => p.Status)
            .IsRequired()
            .HasConversion<int>();

        builder.Property(p => p.Gateway)
            .IsRequired()
            .HasMaxLength(100);

        builder.Property(p => p.GatewayTransactionId)
            .IsRequired()
            .HasMaxLength(255);

        builder.Property(p => p.PaidAt)
            .IsRequired(false);

        builder.Property(p => p.CreatedAt)
            .IsRequired();

        builder.Property(p => p.UpdatedAt)
            .IsRequired(false);

        //? Relationships
        builder.HasOne(p => p.Payer)
            .WithMany(u => u.Payments)
            .HasForeignKey(p => p.PayerId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(p => p.Payee)
            .WithMany()
            .HasForeignKey(p => p.PayeeId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasMany(p => p.ContractPayments)
            .WithOne(cp => cp.Payment)
            .HasForeignKey(cp => cp.PaymentId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}

