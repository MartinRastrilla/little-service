using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Application.Mappers;

public static class ServiceRequestTimelineResolver
{
    private const string Completed = "completed";
    private const string Current = "current";
    private const string Pending = "pending";

    public static IList<ServiceRequestTimelineStepDto> Resolve(ServiceRequest serviceRequest)
    {
        if (serviceRequest.Status == ServiceRequestStatus.Cancelled)
            return ResolveCancelled(serviceRequest);

        return ResolveNormal(serviceRequest);
    }

    private static IList<ServiceRequestTimelineStepDto> ResolveCancelled(ServiceRequest serviceRequest)
    {
        var cancelledAt = serviceRequest.UpdatedAt ?? serviceRequest.CreatedAt;

        return new List<ServiceRequestTimelineStepDto>
        {
            BuildStep(
                "created",
                "Pedido creado",
                FormatOccurredSubtitle(serviceRequest.CreatedAt),
                Completed,
                serviceRequest.CreatedAt),
            BuildStep(
                "receivingApplications",
                "Recibiendo postulaciones",
                "Tu pedido estuvo visible para los profesionales",
                Completed,
                serviceRequest.CreatedAt),
            BuildStep(
                "cancelled",
                "Pedido cancelado",
                FormatOccurredSubtitle(cancelledAt),
                Current,
                cancelledAt),
            BuildStep(
                "professionalSelected",
                "Profesional seleccionado",
                "Aún no se ha seleccionado un profesional",
                Pending,
                null),
            BuildStep(
                "contractSigning",
                "Firma del contrato",
                "El contrato aún no ha sido firmado",
                Pending,
                null),
            BuildStep(
                "workInProgress",
                "Trabajo en obra",
                "El trabajo aún no ha comenzado",
                Pending,
                null),
            BuildStep(
                "workCompleted",
                "Trabajo finalizado",
                "El trabajo aún no ha sido marcado como finalizado",
                Pending,
                null),
        };
    }

    private static IList<ServiceRequestTimelineStepDto> ResolveNormal(ServiceRequest serviceRequest)
    {
        var contract = serviceRequest.Contract;
        var hasFreelancer = serviceRequest.FreelancerPickedId.HasValue;
        var contractSigned = contract?.Status >= ContractStatus.Signed;
        var workCompleted = serviceRequest.Status == ServiceRequestStatus.Closed
            || contract?.Status == ContractStatus.Completed;

        var createdCompleted = true;
        var receivingCompleted = hasFreelancer
            || serviceRequest.Status != ServiceRequestStatus.Opened;
        var professionalCompleted = hasFreelancer;
        var contractCompleted = contractSigned == true;
        var workInProgressCompleted = workCompleted;
        var workCompletedStep = workCompleted;

        var currentKey = ResolveCurrentStepKey(
            serviceRequest,
            hasFreelancer,
            contract,
            contractSigned == true,
            workCompleted);

        var acceptedApplication = serviceRequest.FreelancerApplications
            .FirstOrDefault(fa => fa.Status == FreelancerApplicationStatus.Accepted);

        var professionalSelectedAt = acceptedApplication?.UpdatedAt
            ?? (hasFreelancer ? serviceRequest.UpdatedAt : null);

        var contractSignedAt = ResolveContractSignedAt(contract);
        var workInProgressAt = contractSigned == true ? contractSignedAt : null;
        var workCompletedAt = workCompleted
            ? contract?.UpdatedAt ?? serviceRequest.UpdatedAt
            : null;

        return new List<ServiceRequestTimelineStepDto>
        {
            BuildStep(
                "created",
                "Pedido creado",
                FormatOccurredSubtitle(serviceRequest.CreatedAt),
                StepStatus("created", currentKey, createdCompleted),
                serviceRequest.CreatedAt),
            BuildStep(
                "receivingApplications",
                "Recibiendo postulaciones",
                ResolveReceivingSubtitle(serviceRequest, hasFreelancer, currentKey),
                StepStatus("receivingApplications", currentKey, receivingCompleted),
                receivingCompleted ? serviceRequest.CreatedAt : null),
            BuildStep(
                "professionalSelected",
                "Profesional seleccionado",
                ResolveProfessionalSubtitle(hasFreelancer, currentKey),
                StepStatus("professionalSelected", currentKey, professionalCompleted),
                professionalCompleted ? professionalSelectedAt : null),
            BuildStep(
                "contractSigning",
                "Firma del contrato",
                ResolveContractSigningSubtitle(contract, hasFreelancer, currentKey),
                StepStatus("contractSigning", currentKey, contractCompleted),
                contractCompleted ? contractSignedAt : null),
            BuildStep(
                "workInProgress",
                "Trabajo en obra",
                ResolveWorkInProgressSubtitle(workCompleted, currentKey),
                StepStatus("workInProgress", currentKey, workInProgressCompleted),
                workInProgressCompleted ? workInProgressAt : null),
            BuildStep(
                "workCompleted",
                "Trabajo finalizado",
                ResolveWorkCompletedSubtitle(workCompleted, currentKey),
                StepStatus("workCompleted", currentKey, workCompletedStep),
                workCompletedStep ? workCompletedAt : null),
        };
    }

    private static string ResolveCurrentStepKey(
        ServiceRequest serviceRequest,
        bool hasFreelancer,
        Contract? contract,
        bool contractSigned,
        bool workCompleted)
    {
        if (workCompleted)
            return string.Empty;

        if (contractSigned)
            return "workInProgress";

        if (hasFreelancer && contract != null && contract.Status < ContractStatus.Signed)
            return "contractSigning";

        if (hasFreelancer && contract == null)
            return "professionalSelected";

        if (serviceRequest.Status == ServiceRequestStatus.Opened && !hasFreelancer)
            return "receivingApplications";

        if (hasFreelancer)
            return "contractSigning";

        return "receivingApplications";
    }

    private static string StepStatus(string key, string currentKey, bool completed)
    {
        if (completed)
            return Completed;

        if (!string.IsNullOrEmpty(currentKey) && key == currentKey)
            return Current;

        return Pending;
    }

    private static string ResolveReceivingSubtitle(
        ServiceRequest serviceRequest,
        bool hasFreelancer,
        string currentKey)
    {
        if (currentKey == "receivingApplications")
            return "Los profesionales están enviando sus propuestas";

        if (hasFreelancer)
            return "Tu pedido dejó de recibir postulaciones";

        return "Tu pedido está visible para los profesionales";
    }

    private static string ResolveProfessionalSubtitle(bool hasFreelancer, string currentKey)
    {
        if (hasFreelancer)
            return "Ya hay un profesional asignado a tu pedido";

        if (currentKey == "professionalSelected")
            return "Esperando confirmación del profesional";

        return "Aún no se ha seleccionado un profesional";
    }

    private static string ResolveContractSigningSubtitle(
        Contract? contract,
        bool hasFreelancer,
        string currentKey)
    {
        if (!hasFreelancer)
            return "El contrato aún no ha sido firmado";

        if (contract == null)
            return "El contrato está en preparación";

        return contract.Status switch
        {
            ContractStatus.Draft => currentKey == "contractSigning"
                ? "El contrato está en preparación"
                : "El contrato aún no ha sido firmado",
            ContractStatus.SignedByClient => "Pendiente de firma del profesional",
            ContractStatus.SignedByFreelancer => "Pendiente de tu firma",
            ContractStatus.Signed => "Contrato firmado por ambas partes",
            ContractStatus.Completed => "Contrato firmado por ambas partes",
            _ => "El contrato aún no ha sido firmado",
        };
    }

    private static string ResolveWorkInProgressSubtitle(bool workCompleted, string currentKey)
    {
        if (workCompleted)
            return "El trabajo fue realizado";

        if (currentKey == "workInProgress")
            return "El trabajo está en curso";

        return "El trabajo aún no ha comenzado";
    }

    private static string ResolveWorkCompletedSubtitle(bool workCompleted, string currentKey)
    {
        if (workCompleted)
            return "El pedido fue marcado como finalizado";

        if (currentKey == "workCompleted")
            return "Esperando confirmación de finalización";

        return "El trabajo aún no ha sido marcado como finalizado";
    }

    private static DateTime? ResolveContractSignedAt(Contract? contract)
    {
        if (contract == null || contract.Status < ContractStatus.Signed)
            return null;

        if (contract.SignedByClientAt.HasValue && contract.SignedByFreelancerAt.HasValue)
            return contract.SignedByClientAt > contract.SignedByFreelancerAt
                ? contract.SignedByClientAt
                : contract.SignedByFreelancerAt;

        return contract.SignedByClientAt
            ?? contract.SignedByFreelancerAt
            ?? contract.UpdatedAt;
    }

    private static string FormatOccurredSubtitle(DateTime occurredAt)
    {
        return $"El {occurredAt.ToLocalTime():d MMM. yyyy 'a las' HH:mm}";
    }

    private static ServiceRequestTimelineStepDto BuildStep(
        string key,
        string title,
        string subtitle,
        string status,
        DateTime? occurredAt)
    {
        return new ServiceRequestTimelineStepDto
        {
            Key = key,
            Title = title,
            Subtitle = subtitle,
            Status = status,
            OccurredAt = occurredAt,
        };
    }
}
