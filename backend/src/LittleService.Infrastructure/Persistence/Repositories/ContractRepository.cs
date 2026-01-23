using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class ContractRepository : IContractRepository
{
    private readonly AppDbContext _context;

    public ContractRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Contract?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
                .ThenInclude(cp => cp.Payment)
            .FirstOrDefaultAsync(c => c.Id == id, cancellationToken);
    }

    public async Task<Contract> AddAsync(Contract contract, CancellationToken cancellationToken = default)
    {
        await _context.Contracts.AddAsync(contract, cancellationToken);
        return contract;
    }

    public async Task UpdateAsync(Contract contract, CancellationToken cancellationToken = default)
    {
        _context.Contracts.Update(contract);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var contract = await GetByIdAsync(id, cancellationToken);
        if (contract == null) return false;

        _context.Contracts.Remove(contract);
        return true;
    }

    public async Task<Contract?> GetByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
                .ThenInclude(cp => cp.Payment)
            .FirstOrDefaultAsync(c => c.ServiceRequestId == serviceRequestId, cancellationToken);
    }

    public async Task<IEnumerable<Contract>> GetByStatusAsync(ContractStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Where(c => c.Status == status)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
                .ThenInclude(cp => cp.Payment)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Contract>> GetDraftContractsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Where(c => c.Status == ContractStatus.Draft)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Contract>> GetSignedContractsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Where(c => c.Status == ContractStatus.Signed)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
                .ThenInclude(cp => cp.Payment)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Contract>> GetCompletedContractsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Where(c => c.Status == ContractStatus.Completed)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Contract>> GetContractsByDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Where(c => c.StartDate >= startDate && c.EndDate <= endDate)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Contract>> GetContractsExpiringSoonAsync(DateTime expirationDate, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts
            .Where(c => c.EndDate <= expirationDate)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.Client)
            .Include(c => c.ServiceRequest)
                .ThenInclude(sr => sr.FreelancerPicked)
            .Include(c => c.ContractPayments)
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts.AnyAsync(c => c.Id == id, cancellationToken);
    }

    public async Task<bool> ExistsByServiceRequestIdAsync(Guid serviceRequestId, CancellationToken cancellationToken = default)
    {
        return await _context.Contracts.AnyAsync(c => c.ServiceRequestId == serviceRequestId, cancellationToken);
    }
}