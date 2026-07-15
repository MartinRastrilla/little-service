using System.Linq.Expressions;
using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class ServiceRequestFilterPredicateBuilder
{
    private static readonly ContractStatus[] InProgressContractStatuses =
    [
        ContractStatus.Draft,
        ContractStatus.SignedByClient,
        ContractStatus.SignedByFreelancer,
        ContractStatus.Signed
    ];

    public static Expression<Func<ServiceRequest, bool>>? Build(string? filter)
    {
        if (string.IsNullOrWhiteSpace(filter))
            return null;

        return filter.Trim().ToLowerInvariant() switch
        {
            "open" => sr => sr.Status == ServiceRequestStatus.Opened && sr.FreelancerPickedId == null,
            "inprogress" => sr => sr.FreelancerPickedId != null &&
                (sr.Contract == null || InProgressContractStatuses.Contains(sr.Contract.Status)),
            "completed" => sr => sr.Status == ServiceRequestStatus.Closed ||
                (sr.Contract != null && sr.Contract.Status == ContractStatus.Completed),
            "cancelled" => sr => sr.Status == ServiceRequestStatus.Cancelled ||
                (sr.Contract != null && sr.Contract.Status == ContractStatus.Cancelled),
            _ => null
        };
    }
}
