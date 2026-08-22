using LittleService.Domain.Exceptions;

namespace LittleService.Domain.Entities;

public class Message : BaseEntity
{
    public const int MaxContentLength = 2000;

    public Guid FromUserId { get; set; }
    public User FromUser { get; set; } = null!;

    public Guid ToUserId { get; set; }
    public User ToUser { get; set; } = null!;

    public Guid ServiceRequestId { get; set; }
    public ServiceRequest ServiceRequest { get; set; } = null!;

    public string Content { get; set; } = null!;

    public bool IsRead { get; set; } = false;

    public static Message Create(Guid fromUserId, Guid toUserId, Guid serviceRequestId, string content)
    {
        if (fromUserId == Guid.Empty)
            throw new DomainException("El remitente no es válido", "INVALID_SENDER");

        if (toUserId == Guid.Empty)
            throw new DomainException("El destinatario no es válido", "INVALID_RECIPIENT");

        if (fromUserId == toUserId)
            throw new DomainException("No podés enviarte mensajes a vos mismo", "SELF_MESSAGE_NOT_ALLOWED");

        if (serviceRequestId == Guid.Empty)
            throw new DomainException("La solicitud de servicio no es válida", "INVALID_SERVICE_REQUEST");

        if (string.IsNullOrWhiteSpace(content))
            throw new DomainException("El mensaje no puede estar vacío", "MESSAGE_CONTENT_EMPTY");

        var trimmedContent = content.Trim();
        if (trimmedContent.Length > MaxContentLength)
            throw new DomainException(
                $"El mensaje no puede superar {MaxContentLength} caracteres",
                "MESSAGE_CONTENT_TOO_LONG");

        return new Message
        {
            Id = Guid.NewGuid(),
            FromUserId = fromUserId,
            ToUserId = toUserId,
            ServiceRequestId = serviceRequestId,
            Content = trimmedContent,
            IsRead = false,
            CreatedAt = DateTime.UtcNow
        };
    }
}
