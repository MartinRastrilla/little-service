using LittleService.Application.DTOs.Contracts;
using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class ContractMapper
{
    public static ContractDto Map(
        Contract contract,
        decimal? suggestedAmount,
        bool isClientOwner,
        bool isAssignedFreelancer)
    {
        var isPartiallySigned = contract.Status is ContractStatus.SignedByClient
            or ContractStatus.SignedByFreelancer;

        var canEdit = isClientOwner && contract.IsDraft();
        var canSign = (isClientOwner && contract.CanBeSignedByClient())
            || (isAssignedFreelancer && contract.CanBeSignedByFreelancer());
        var canCancelPartial = (isClientOwner || isAssignedFreelancer) && isPartiallySigned;

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
            CanSign = canSign,
            CanCancelPartial = canCancelPartial,
            SignedByClientAt = contract.SignedByClientAt,
            SignedByFreelancerAt = contract.SignedByFreelancerAt,
            CreatedAt = contract.CreatedAt,
            UpdatedAt = contract.UpdatedAt
        };
    }
}
