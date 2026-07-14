using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class ServiceRequestDisplayStatusResolver
{
    public static string Resolve(
        ServiceRequestStatus status,
        Guid? freelancerPickedId,
        ContractStatus? contractStatus)
    {
        if (freelancerPickedId == null)
            return status.ToString();

        if (contractStatus == null)
            return "InProgress";

        return contractStatus.Value.ToString();
    }
}
