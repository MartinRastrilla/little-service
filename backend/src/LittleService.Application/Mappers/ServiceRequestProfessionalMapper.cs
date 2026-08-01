using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappers;

public static class ServiceRequestProfessionalMapper
{
    public static ServiceRequestProfessionalDto Map(ServiceRequest serviceRequest)
    {
        var contract = serviceRequest.Contract;
        var contractStatus = contract?.Status;
        var displayStatus = ServiceRequestDisplayStatusResolver.Resolve(
            serviceRequest.Status,
            serviceRequest.FreelancerPickedId,
            contractStatus);

        var dto = new ServiceRequestProfessionalDto
        {
            HasAssignedProfessional = serviceRequest.FreelancerPickedId.HasValue,
            FreelancerId = serviceRequest.FreelancerPickedId,
            ServiceLocation = serviceRequest.Location,
            DisplayStatus = displayStatus,
            ContractSummary = MapContractSummary(contract),
            Actions = MapActions(serviceRequest, contract)
        };

        if (serviceRequest.FreelancerPickedId.HasValue)
        {
            var acceptedApplication = serviceRequest.FreelancerApplications
                .FirstOrDefault(a =>
                    a.FreelancerId == serviceRequest.FreelancerPickedId.Value &&
                    a.IsAccepted());

            dto.SelectedAt = acceptedApplication?.UpdatedAt ?? acceptedApplication?.CreatedAt;
        }

        return dto;
    }

    private static ServiceRequestContractSummaryDto MapContractSummary(Contract? contract)
    {
        if (contract == null)
        {
            return new ServiceRequestContractSummaryDto { HasContract = false };
        }

        var status = contract.Status.ToString();
        return new ServiceRequestContractSummaryDto
        {
            HasContract = true,
            StartDate = contract.StartDate,
            Amount = contract.Amount,
            Status = status,
            DisplayStatus = status
        };
    }

    private static ServiceRequestProfessionalActionsDto MapActions(
        ServiceRequest serviceRequest,
        Contract? contract)
    {
        var hasProfessional = serviceRequest.FreelancerPickedId.HasValue;

        return new ServiceRequestProfessionalActionsDto
        {
            CanRevokeEngagement = serviceRequest.CanRevokeEngagement(contract),
            RevokeEngagementBlockedReason = serviceRequest.GetRevokeEngagementBlockedReason(contract),
            CanOpenProfile = hasProfessional,
            CanOpenChat = false,
            CanCall = false,
            CanViewContract = false
        };
    }
}
