using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class FreelancerApplicationDisplayStatusResolver
{
    public static string Resolve(FreelancerApplicationStatus status)
    {
        return status switch
        {
            FreelancerApplicationStatus.Pending => "Esperando respuesta",
            FreelancerApplicationStatus.Accepted => "Aceptada",
            FreelancerApplicationStatus.Rejected => "No seleccionada",
            _ => status.ToString()
        };
    }
}
