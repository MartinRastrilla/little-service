using System.Linq.Expressions;
using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class FreelancerJobFilterPredicateBuilder
{
    public static bool IsValidFilter(string? filter)
    {
        if (string.IsNullOrWhiteSpace(filter))
            return true;

        return filter.Trim().ToLowerInvariant() switch
        {
            "all" or "inprogress" or "completed" => true,
            _ => false
        };
    }

    public static Expression<Func<ServiceRequest, bool>>? Build(string? filter)
    {
        if (string.IsNullOrWhiteSpace(filter))
            return null;

        return filter.Trim().ToLowerInvariant() switch
        {
            "all" => null,
            "inprogress" => sr =>
                sr.Status != ServiceRequestStatus.Cancelled &&
                (sr.Contract == null || sr.Contract.Status != ContractStatus.Cancelled) &&
                (sr.Contract == null || sr.Contract.Status != ContractStatus.Completed),
            "completed" => sr =>
                sr.Contract != null &&
                sr.Contract.Status == ContractStatus.Completed,
            _ => null
        };
    }
}
