using LittleService.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace LittleService.Infrastructure.Persistence.Configurations;

public class ClientConfiguration : IEntityTypeConfiguration<Client>
{
    public void Configure(EntityTypeBuilder<Client> builder)
    {
        builder.HasKey(c => c.Id);

        builder.Property(c => c.TotalContracts)
            .IsRequired()
            .HasDefaultValue(0);

        builder.Property(c => c.Address)
            .IsRequired(false)
            .HasMaxLength(500);

        //? Relationships
        builder.HasOne(c => c.User)
            .WithOne(u => u.Client)
            .HasForeignKey<Client>(c => c.Id)
            .OnDelete(DeleteBehavior.Cascade);
    }
}