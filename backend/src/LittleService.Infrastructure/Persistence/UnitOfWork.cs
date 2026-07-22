using LittleService.Domain.Interfaces.Repositories;
using LittleService.Infrastructure.Persistence.Repositories;
using Microsoft.EntityFrameworkCore.Storage;

namespace LittleService.Infrastructure.Persistence;

public class UnitOfWork : IUnitOfWork
{
    private readonly AppDbContext _context;
    private IDbContextTransaction? _transaction;

    public UnitOfWork(AppDbContext context)
    {
        _context = context;
        Users = new UserRepository(context);
        Roles = new RoleRepository(context);
        ServiceRequests = new ServiceRequestRepository(context);
        Contracts = new ContractRepository(context);
        Payments = new PaymentRepository(context);
        FreelancerApplications = new FreelancerApplicationRepository(context);
        Services = new ServiceRepository(context);
        Notifications = new NotificationRepository(context);
        Ratings = new RatingRepository(context);
        Reports = new ReportRepository(context);
        Messages = new MessageRepository(context);
        RefreshTokens = new RefreshTokenRepository(context);
    }

    public IUserRepository Users { get; private set; }
    public IRoleRepository Roles { get; private set; }
    public IServiceRequestRepository ServiceRequests { get; private set; }
    public IContractRepository Contracts { get; private set; }
    public IPaymentRepository Payments { get; private set; }
    public IFreelancerApplicationRepository FreelancerApplications { get; private set; }
    public IServiceRepository Services { get; private set; }
    public INotificationRepository Notifications { get; private set; }
    public IRatingRepository Ratings { get; private set; }
    public IReportRepository Reports { get; private set; }
    public IMessageRepository Messages { get; private set; }
    public IRefreshTokenRepository RefreshTokens { get; private set; }


    public async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task BeginTransactionAsync(CancellationToken cancellationToken = default)
    {
        _transaction = await _context.Database.BeginTransactionAsync(cancellationToken);
    }

    public async Task CommitTransactionAsync(CancellationToken cancellationToken = default)
    {
        if (_transaction != null)
        {
            await _transaction.CommitAsync(cancellationToken);
            _transaction.Dispose();
            _transaction = null;
        }
    }

    public async Task RollbackTransactionAsync(CancellationToken cancellationToken = default)
    {
        if (_transaction != null)
        {
            await _transaction.RollbackAsync(cancellationToken);
            await _transaction.DisposeAsync();
            _transaction = null;
        }
    }

    public void Dispose()
    {
        _transaction?.Dispose();
        _context.Dispose();
    }
}