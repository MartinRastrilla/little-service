using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Entities;
using LittleService.Domain.Exceptions;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.ApplyToServiceRequest;

public class ApplyToServiceRequestCommandHandler : IRequestHandler<ApplyToServiceRequestCommand, Result<ApplyToServiceRequestResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<ApplyToServiceRequestCommandHandler> _logger;

    public ApplyToServiceRequestCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<ApplyToServiceRequestCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<ApplyToServiceRequestResult>> Handle(ApplyToServiceRequestCommand command, CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<ApplyToServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<ApplyToServiceRequestResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdAsync(command.ServiceRequestId, cancellationToken);
        if (serviceRequest == null)
            return Result<ApplyToServiceRequestResult>.Failure("Solicitud de servicio no encontrada", "SERVICE_REQUEST_NOT_FOUND");

        var alreadyApplied = await _unitOfWork.FreelancerApplications.HasPendingApplicationAsync(
            command.ServiceRequestId, user.Freelancer.Id, cancellationToken);
        if (alreadyApplied)
            return Result<ApplyToServiceRequestResult>.Failure("Ya has aplicado a esta solicitud", "ALREADY_APPLIED");

        FreelancerApplication application;
        try
        {
            application = FreelancerApplication.Create(command.ServiceRequestId, user.Freelancer.Id, serviceRequest);
        }
        catch (DomainException ex)
        {
            return Result<ApplyToServiceRequestResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.FreelancerApplications.AddAsync(application, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al aplicar a la solicitud {ServiceRequestId}", command.ServiceRequestId);
            return Result<ApplyToServiceRequestResult>.Failure("Error al aplicar a la solicitud", "APPLY_TO_SERVICE_REQUEST_ERROR");
        }

        // Reload application with freelancer user data for mapping
        var savedApplication = await _unitOfWork.FreelancerApplications.GetByServiceRequestAndFreelancerAsync(
            command.ServiceRequestId, user.Freelancer.Id, cancellationToken);

        _logger.LogInformation("Freelancer {FreelancerId} aplicó a ServiceRequest {ServiceRequestId}", user.Freelancer.Id, command.ServiceRequestId);
        var dto = _mapper.Map<FreelancerApplicationSummaryDto>(savedApplication ?? application);
        return Result<ApplyToServiceRequestResult>.Success(new ApplyToServiceRequestResult { Application = dto });
    }
}
