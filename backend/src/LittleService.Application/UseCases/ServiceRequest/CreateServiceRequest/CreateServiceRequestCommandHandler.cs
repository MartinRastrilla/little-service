using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.ServiceRequests;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.ServiceRequest.CreateServiceRequest;

public class CreateServiceRequestCommandHandler : IRequestHandler<CreateServiceRequestCommand, Result<CreateServiceRequestResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<CreateServiceRequestCommandHandler> _logger;

    public CreateServiceRequestCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<CreateServiceRequestCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<CreateServiceRequestResult>> Handle(CreateServiceRequestCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CreateServiceRequestResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Client == null)
            return Result<CreateServiceRequestResult>.Failure("Perfil de cliente no encontrado", "CLIENT_NOT_FOUND");

        Domain.Entities.ServiceRequest serviceRequest;
        try
        {
            serviceRequest = Domain.Entities.ServiceRequest.Create(
                req.Title,
                req.Description,
                req.Location,
                user.Client.Id,
                req.Price);
        }
        catch (Domain.Exceptions.DomainException ex)
        {
            return Result<CreateServiceRequestResult>.Failure(ex.Message, ex.ErrorCode);
        }

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.ServiceRequests.AddAsync(serviceRequest, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al crear la solicitud de servicio");
            return Result<CreateServiceRequestResult>.Failure("Error al crear la solicitud de servicio", "CREATE_SERVICE_REQUEST_ERROR");
        }

        var dto = _mapper.Map<ServiceRequestDetailDto>(serviceRequest);
        _logger.LogInformation("ServiceRequest {Id} creado por cliente {ClientId}", serviceRequest.Id, user.Client.Id);
        return Result<CreateServiceRequestResult>.Success(new CreateServiceRequestResult { ServiceRequest = dto });
    }
}
