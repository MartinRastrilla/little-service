namespace LittleService.Domain.Entities;

public class ContractPayment : BaseEntity
{
    public Guid ContractId { get; set; }
    public Contract Contract { get; set; } = null!;

    public Guid PaymentId { get; set; }
    public Payment Payment { get; set; } = null!;
}

