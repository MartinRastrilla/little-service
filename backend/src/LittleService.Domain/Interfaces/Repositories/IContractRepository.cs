using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IContractRepository
{
    //? CRUD Basic Methods
    Task<Contract?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Contract> AddAsync(Contract contract, CancellationToken cancellationToken = default);
    Task UpdateAsync(Contract contract, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for Service Request (1:1)
    Task<Contract?> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);

    //? Query by status
    Task<IEnumerable<Contract>> GetByStatusAsync(ContractStatus status, CancellationToken cancellationToken = default);
    Task<IEnumerable<Contract>> GetDraftContractsAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Contract>> GetSignedContractsAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Contract>> GetCompletedContractsAsync(CancellationToken cancellationToken = default);

    //? Query by dates
    Task<IEnumerable<Contract>> GetContractsByDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);
    Task<IEnumerable<Contract>> GetContractsExpiringSoonAsync(DateTime expirationDate, CancellationToken cancellationToken = default);

    //? Query validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> ExistsByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default);
}