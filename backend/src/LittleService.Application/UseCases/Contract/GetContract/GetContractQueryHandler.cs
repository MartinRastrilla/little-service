using LittleService.Application.Common;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using Mediator;

namespace LittleService.Application.UseCases.Contract.GetContract;

public class GetContractQueryHandler : IRequestHandler<GetContractQuery, Result<GetContractResult>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetContractQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async ValueTask<Result<GetContractResult>> Handle(
        GetContractQuery query,
        CancellationToken cancellationToken)
    {
        var user = await _unitOfWork.Users.GetByIdAsync(query.UserId, cancellationToken);
        if (user == null)
            return Result<GetContractResult>.Failure("Usuario no encontrado", "USER_NOT_FOUND");

        var serviceRequest = await _unitOfWork.ServiceRequests.GetByIdWithApplicationsAsync(
            query.ServiceRequestId,
            cancellationToken);
        if (serviceRequest == null)
            return Result<GetContractResult>.Failure(
                "Solicitud de servicio no encontrada",
                "SERVICE_REQUEST_NOT_FOUND");

        var isClientOwner = user.Client != null && serviceRequest.ClientId == user.Client.Id;
        var isAssignedFreelancer = serviceRequest.FreelancerPickedId.HasValue &&
                                   serviceRequest.FreelancerPickedId.Value == user.Id;

        if (!isClientOwner && !isAssignedFreelancer)
            return Result<GetContractResult>.Failure(
                "No tienes permisos para ver este contrato",
                "FORBIDDEN");

        if (serviceRequest.Contract == null)
            return Result<GetContractResult>.Failure(
                "Este pedido aún no tiene un contrato",
                "CONTRACT_NOT_FOUND");

        return Result<GetContractResult>.Success(new GetContractResult
        {
            Contract = ContractMapper.Map(
                serviceRequest.Contract,
                serviceRequest.Price,
                isClientOwner,
                isAssignedFreelancer)
        });
    }
}
