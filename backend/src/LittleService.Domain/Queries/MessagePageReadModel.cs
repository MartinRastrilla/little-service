using LittleService.Domain.Entities;

namespace LittleService.Domain.Queries;

public class MessagePageReadModel
{
    public IReadOnlyList<Message> Items { get; init; } = [];
    public DateTime? NextCursor { get; init; }
    public bool HasMore { get; init; }
}
