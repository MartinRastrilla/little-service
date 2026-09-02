using LittleService.Application.DTOs.Contracts;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappers;

public static class ContractMapper
{
    public static ContractDto Map(Contract contract, decimal? suggestedAmount, bool canEdit)
    {
        return new ContractDto
        {
            Id = contract.Id,
            ServiceRequestId = contract.ServiceRequestId,
            Terms = contract.Terms,
            StartDate = contract.StartDate,
            EndDate = contract.EndDate,
            Amount = contract.Amount,
            Status = contract.Status.ToString(),
            SuggestedAmount = suggestedAmount,
            CanEdit = canEdit,
            SignedByClientAt = contract.SignedByClientAt,
            SignedByFreelancerAt = contract.SignedByFreelancerAt,
            CreatedAt = contract.CreatedAt,
            UpdatedAt = contract.UpdatedAt
        };
    }
}
