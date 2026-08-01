using LittleService.Application.Common;
using Mediator;

namespace LittleService.Application.UseCases.ServiceRequest.UpdateServiceRequest;

public class UpdateServiceRequestCommand : IRequest<Result<UpdateServiceRequestResult>>
{
    public Guid UserId { get; set; }
    public Guid ServiceRequestId { get; set; }
    public UpdateServiceRequestRequest Request { get; set; } = null!;
    public IList<ServiceRequestPhotoUploadInput> NewPhotos { get; set; } = new List<ServiceRequestPhotoUploadInput>();
}
