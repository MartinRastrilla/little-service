namespace LittleService.Domain.Entities.Enums;

public enum ContractStatus
{
    Draft = 1,
    SignedByClient = 2,
    SignedByFreelancer = 3,
    Signed = 4,
    Cancelled = 5,
    Completed = 6
}