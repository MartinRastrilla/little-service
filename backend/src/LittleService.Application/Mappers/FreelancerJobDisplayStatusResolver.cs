using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class FreelancerJobDisplayStatusResolver
{
    public static string Resolve(ServiceRequestStatus status, ContractStatus? contractStatus)
    {
        if (status == ServiceRequestStatus.Cancelled ||
            contractStatus == ContractStatus.Cancelled)
        {
            return "Cancelado";
        }

        if (contractStatus == ContractStatus.Completed)
        {
            return "Finalizado";
        }

        return "En curso";
    }
}
