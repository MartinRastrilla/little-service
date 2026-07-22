namespace LittleService.Domain.Interfaces.Repositories;

public interface IUnitOfWork : IDisposable
{
    IUserRepository Users { get; }
    IRoleRepository Roles { get; }
    IServiceRequestRepository ServiceRequests { get; }
    IContractRepository Contracts { get; }
    IPaymentRepository Payments { get; }
    IFreelancerApplicationRepository FreelancerApplications { get; }
    IServiceRepository Services { get; }
    INotificationRepository Notifications { get; }
    IRatingRepository Ratings { get; }
    IReportRepository Reports { get; }
    IMessageRepository Messages { get; }
    IRefreshTokenRepository RefreshTokens { get; }

    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
    Task BeginTransactionAsync(CancellationToken cancellationToken = default);
    Task CommitTransactionAsync(CancellationToken cancellationToken = default);
    Task RollbackTransactionAsync(CancellationToken cancellationToken = default);
}