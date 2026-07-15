namespace LittleService.Application.DTOs.Common;

public class PagedResultDto<T>
{
    public IList<T> Items { get; set; } = new List<T>();
    public int TotalCount { get; set; }
    public int Page { get; set; }
    public int PageSize { get; set; }
    public bool HasMore { get; set; }
}
