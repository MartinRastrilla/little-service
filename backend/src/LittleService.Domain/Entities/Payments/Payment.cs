using LittleService.Domain.Entities.Enums;
using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class Payment : BaseEntity
{
    public Guid PayerId { get; private set; }
    public User Payer { get; private set; } = null!;

    public Guid PayeeId { get; private set; }
    public User Payee { get; private set; } = null!;

    public decimal Amount { get; private set; }

    public PaymentStatus Status { get; private set; } = PaymentStatus.Pending;

    public string Gateway { get; private set; } = null!;
    public string GatewayTransactionId { get; private set; } = null!;

    public DateTime? PaidAt { get; private set; }

    /* === Relationships === */
    public ICollection<ContractPayment> ContractPayments { get; private set; } = new List<ContractPayment>();

    private Payment() { }

    /// <summary>
    /// Creates a new Payment in Pending status.
    /// </summary>
    /// <param name="payerId">ID of the user making the payment</param>
    /// <param name="payeeId">ID of the user receiving the payment</param>
    /// <param name="amount">Payment amount</param>
    /// <param name="gateway">Payment gateway name (e.g., "Mercado Pago", "PayPal")</param>
    /// <param name="gatewayTransactionId">Transaction ID from the payment gateway</param>
    /// <returns>New Payment instance in Pending status</returns>
    /// <exception cref="DomainException">If validations fail</exception>
    public static Payment Create(
        Guid payerId,
        Guid payeeId,
        decimal amount,
        string gateway,
        string gatewayTransactionId)
    {
        //? Validations
        ValidatePayerAndPayee(payerId, payeeId);
        ValidateAmount(amount);
        ValidateGateway(gateway);
        ValidateGatewayTransactionId(gatewayTransactionId);

        return new Payment
        {
            Id = Guid.NewGuid(),
            PayerId = payerId,
            PayeeId = payeeId,
            Amount = amount,
            Gateway = gateway.Trim(),
            GatewayTransactionId = gatewayTransactionId.Trim(),
            Status = PaymentStatus.Pending,
            PaidAt = null,
            CreatedAt = DateTime.UtcNow
        };
    }

    /// <summary>
    /// Starts processing the payment.
    /// Transitions: Pending → Processing
    /// </summary>
    public void StartProcessing()
    {
        if (Status != PaymentStatus.Pending)
            throw new DomainException(
                "No se puede iniciar el procesamiento de un pago que no está en estado Pendiente",
                "INVALID_STATUS_TRANSITION");

        Status = PaymentStatus.Processing;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Marks the payment as completed.
    /// Transitions: Pending/Processing → Completed
    /// Sets PaidAt to current date/time.
    /// </summary>
    public void Complete()
    {
        if (Status == PaymentStatus.Completed)
            return; // Idempotent

        if (Status == PaymentStatus.Failed)
            throw new DomainException(
                "No se puede completar un pago fallido. Cree un nuevo pago para reintentar",
                "PAYMENT_FAILED");

        if (Status == PaymentStatus.Refunded)
            throw new DomainException(
                "No se puede completar un pago reembolsado",
                "PAYMENT_REFUNDED");

        Status = PaymentStatus.Completed;
        PaidAt = DateTime.UtcNow;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Marks the payment as failed.
    /// Transitions: Pending/Processing → Failed
    /// </summary>
    public void MarkAsFailed()
    {
        if (Status == PaymentStatus.Failed)
            return; // Idempotent

        if (Status == PaymentStatus.Completed)
            throw new DomainException(
                "No se puede marcar un pago completado como fallido. Procese un reembolso en su lugar",
                "PAYMENT_COMPLETED");

        if (Status == PaymentStatus.Refunded)
            throw new DomainException(
                "No se puede marcar un pago reembolsado como fallido",
                "PAYMENT_REFUNDED");

        Status = PaymentStatus.Failed;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Processes a refund for the payment.
    /// Only available for completed payments.
    /// Transitions: Completed → Refunded
    /// </summary>
    public void Refund()
    {
        if (Status == PaymentStatus.Refunded)
            return; // Idempotent

        if (Status != PaymentStatus.Completed)
            throw new DomainException(
                "No se puede reembolsar un pago que no está completado",
                "PAYMENT_NOT_COMPLETED");

        Status = PaymentStatus.Refunded;
        UpdatedAt = DateTime.UtcNow;
    }

    /// <summary>
    /// Indicates if the payment is in Pending status.
    /// </summary>
    public bool IsPending() => Status == PaymentStatus.Pending;

    /// <summary>
    /// Indicates if the payment is being processed.
    /// </summary>
    public bool IsProcessing() => Status == PaymentStatus.Processing;

    /// <summary>
    /// Indicates if the payment has been completed.
    /// </summary>
    public bool IsCompleted() => Status == PaymentStatus.Completed;

    /// <summary>
    /// Indicates if the payment has failed.
    /// </summary>
    public bool IsFailed() => Status == PaymentStatus.Failed;

    /// <summary>
    /// Indicates if the payment has been refunded.
    /// </summary>
    public bool IsRefunded() => Status == PaymentStatus.Refunded;

    /// <summary>
    /// Indicates if the payment is in a finalized state (Completed, Failed, or Refunded).
    /// </summary>
    public bool IsFinalized() => Status == PaymentStatus.Completed ||
                                 Status == PaymentStatus.Failed ||
                                 Status == PaymentStatus.Refunded;

    /// <summary>
    /// Indicates if the payment can start processing.
    /// </summary>
    public bool CanBeProcessed() => Status == PaymentStatus.Pending;

    /// <summary>
    /// Indicates if the payment can be completed.
    /// </summary>
    public bool CanBeCompleted() => Status == PaymentStatus.Pending ||
                                    Status == PaymentStatus.Processing;

    /// <summary>
    /// Indicates if the payment can be refunded.
    /// </summary>
    public bool CanBeRefunded() => Status == PaymentStatus.Completed;

    /// <summary>
    /// Validates that payer and payee are different users.
    /// </summary>
    private static void ValidatePayerAndPayee(Guid payerId, Guid payeeId)
    {
        if (payerId == payeeId)
            throw new DomainException(
                "El pagador y el pagado no pueden ser el mismo usuario",
                "INVALID_PAYER_PAYEE");
    }

    /// <summary>
    /// Validates the payment amount.
    /// </summary>
    private static void ValidateAmount(decimal amount)
    {
        if (amount <= 0)
            throw new DomainException(
                "El monto del pago debe ser mayor a cero",
                "INVALID_AMOUNT");

        if (amount > 999999999.99m) // Límite para decimal(18,2)
            throw new DomainException(
                "El monto del pago excede el máximo permitido",
                "AMOUNT_TOO_HIGH");
    }

    /// <summary>
    /// Validates the payment gateway name.
    /// </summary>
    private static void ValidateGateway(string gateway)
    {
        if (string.IsNullOrWhiteSpace(gateway))
            throw new DomainException(
                "La pasarela de pago es requerida",
                "GATEWAY_REQUIRED");

        if (gateway.Trim().Length > 100)
            throw new DomainException(
                "El nombre de la pasarela de pago no puede exceder 100 caracteres",
                "GATEWAY_TOO_LONG");
    }

    /// <summary>
    /// Validates the gateway transaction ID.
    /// </summary>
    private static void ValidateGatewayTransactionId(string gatewayTransactionId)
    {
        if (string.IsNullOrWhiteSpace(gatewayTransactionId))
            throw new DomainException(
                "El ID de la transacción de la pasarela de pago es requerido",
                "GATEWAY_TRANSACTION_ID_REQUIRED");

        if (gatewayTransactionId.Trim().Length > 255)
            throw new DomainException(
                "El ID de la transacción de la pasarela de pago no puede exceder 255 caracteres",
                "GATEWAY_TRANSACTION_ID_TOO_LONG");
    }
}