using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Interfaces.Repositories;
using Microsoft.EntityFrameworkCore;

namespace LittleService.Infrastructure.Persistence.Repositories;

public class PaymentRepository : IPaymentRepository
{
    private readonly AppDbContext _context;

    public PaymentRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<Payment?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .FirstOrDefaultAsync(p => p.Id == id, cancellationToken);
    }

    public async Task<Payment> AddAsync(Payment payment, CancellationToken cancellationToken = default)
    {
        await _context.Payments.AddAsync(payment, cancellationToken);
        return payment;
    }

    public async Task UpdateAsync(Payment payment, CancellationToken cancellationToken = default)
    {
        _context.Payments.Update(payment);
        await Task.CompletedTask;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var payment = await GetByIdAsync(id, cancellationToken);
        if (payment == null) return false;

        _context.Payments.Remove(payment);
        return true;
    }

    public async Task<IEnumerable<Payment>> GetByPayerIdAsync(Guid payerId, CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.PayerId == payerId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetByPayeeIdAsync(Guid payeeId, CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.PayeeId == payeeId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetByStatusAsync(PaymentStatus status, CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.Status == status)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetPendingPaymentsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.Status == PaymentStatus.Pending)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetCompletedPaymentsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.Status == PaymentStatus.Completed)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetFailedPaymentsAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.Status == PaymentStatus.Failed)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetPaymentsByDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.PaidAt >= startDate && p.PaidAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Payment>> GetPaymentsByPaidDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default)
    {
        return await _context.Payments
            .Include(p => p.Payer)
            .Include(p => p.Payee)
            .Include(p => p.ContractPayments)
                .ThenInclude(cp => cp.Contract)
            .Where(p => p.PaidAt >= startDate && p.PaidAt <= endDate)
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await _context.Payments.AnyAsync(p => p.Id == id, cancellationToken);
    }

    public async Task<bool> ExistsByGatewayTransactionIdAsync(string gatewayTransactionId, CancellationToken cancellationToken = default)
    {
        return await _context.Payments.AnyAsync(p => p.GatewayTransactionId == gatewayTransactionId, cancellationToken);
    }
}