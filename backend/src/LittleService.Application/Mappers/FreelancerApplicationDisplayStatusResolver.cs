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

    /// <summary>
    /// Resolves display status for the client applications list, including derived
    /// status for stale pending applications when the service request no longer accepts applications.
    /// </summary>
    public static string ResolveForClientView(
        FreelancerApplicationStatus status,
        bool canManageApplications)
    {
        return status switch
        {
            FreelancerApplicationStatus.Accepted => "Aceptada",
            FreelancerApplicationStatus.Rejected => "No seleccionada",
            FreelancerApplicationStatus.Pending when canManageApplications => "Esperando respuesta",
            FreelancerApplicationStatus.Pending => "No seleccionada",
            _ => status.ToString()
        };
    }
}
