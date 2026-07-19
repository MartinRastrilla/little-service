using LittleService.Application.DTOs.ServiceRequests;

namespace LittleService.Application.UseCases.ServiceRequest.GetOpenServiceRequestDetail;

public class GetOpenServiceRequestDetailResult
{
    public OpenServiceRequestDetailDto ServiceRequest { get; set; } = null!;
}
