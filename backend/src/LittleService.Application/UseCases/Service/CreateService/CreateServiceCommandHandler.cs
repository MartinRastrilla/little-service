using AutoMapper;
using LittleService.Application.Common;
using LittleService.Application.DTOs.Services;
using LittleService.Domain.Entities;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;
using Microsoft.Extensions.Logging;

namespace LittleService.Application.UseCases.Service.CreateService;

public class CreateServiceCommandHandler : IRequestHandler<CreateServiceCommand, Result<CreateServiceResult>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;
    private readonly ILogger<CreateServiceCommandHandler> _logger;

    public CreateServiceCommandHandler(IUnitOfWork unitOfWork, IMapper mapper, ILogger<CreateServiceCommandHandler> logger)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
        _logger = logger;
    }

    public async ValueTask<Result<CreateServiceResult>> Handle(CreateServiceCommand command, CancellationToken cancellationToken)
    {
        var req = command.Request;

        if (string.IsNullOrWhiteSpace(req.Title))
            return Result<CreateServiceResult>.Failure("El título es requerido", "TITLE_REQUIRED");
        if (string.IsNullOrWhiteSpace(req.Description))
            return Result<CreateServiceResult>.Failure("La descripción es requerida", "DESCRIPTION_REQUIRED");
        if (req.Price <= 0)
            return Result<CreateServiceResult>.Failure("El precio debe ser mayor a cero", "INVALID_PRICE");

        var user = await _unitOfWork.Users.GetByIdAsync(command.UserId, cancellationToken);
        if (user == null)
            return Result<CreateServiceResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");
        if (user.Freelancer == null)
            return Result<CreateServiceResult>.Failure("Perfil de freelancer no encontrado", "FREELANCER_NOT_FOUND");

        var service = new Domain.Entities.Service
        {
            Id = Guid.NewGuid(),
            FreelancerId = user.Freelancer.Id,
            Title = req.Title.Trim(),
            Description = req.Description.Trim(),
            Price = req.Price,
            IsActive = true,
            CreatedAt = DateTime.UtcNow
        };

        await _unitOfWork.BeginTransactionAsync(cancellationToken);
        try
        {
            await _unitOfWork.Services.AddAsync(service, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            await _unitOfWork.CommitTransactionAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            await _unitOfWork.RollbackTransactionAsync(cancellationToken);
            _logger.LogError(ex, "Error al crear el servicio");
            return Result<CreateServiceResult>.Failure("Error al crear el servicio", "CREATE_SERVICE_ERROR");
        }

        _logger.LogInformation("Servicio {Id} creado por freelancer {FreelancerId}", service.Id, user.Freelancer.Id);
        var dto = _mapper.Map<ServiceDto>(service);
        return Result<CreateServiceResult>.Success(new CreateServiceResult { Service = dto });
    }
}
