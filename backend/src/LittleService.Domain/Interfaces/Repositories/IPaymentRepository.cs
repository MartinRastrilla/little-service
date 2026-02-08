using LittleService.Domain.Entities;
using LittleService.Domain.Entities.Enums;

namespace LittleService.Domain.Interfaces.Repositories;

public interface IPaymentRepository
{
    //? CRUD Basic Methods
    Task<Payment?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<Payment> AddAsync(Payment payment, CancellationToken cancellationToken = default);
    Task UpdateAsync(Payment payment, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    //? Query for relationships
    Task<IEnumerable<Payment>> GetByPayerIdAsync(Guid payerId, CancellationToken cancellationToken = default);
    Task<IEnumerable<Payment>> GetByPayeeIdAsync(Guid payeeId, CancellationToken cancellationToken = default);

    //? Queries for status
    Task<IEnumerable<Payment>> GetByStatusAsync(PaymentStatus status, CancellationToken cancellationToken = default);
    Task<IEnumerable<Payment>> GetPendingPaymentsAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Payment>> GetCompletedPaymentsAsync(CancellationToken cancellationToken = default);
    Task<IEnumerable<Payment>> GetFailedPaymentsAsync(CancellationToken cancellationToken = default);

    //? Combined Queries
    Task<IEnumerable<Payment>> GetPaymentsByDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);
    Task<IEnumerable<Payment>> GetPaymentsByPaidDateRangeAsync(DateTime startDate, DateTime endDate, CancellationToken cancellationToken = default);

    //? Queries for validations
    Task<bool> ExistsAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> ExistsByGatewayTransactionIdAsync(string gatewayTransactionId, CancellationToken cancellationToken = default);
}