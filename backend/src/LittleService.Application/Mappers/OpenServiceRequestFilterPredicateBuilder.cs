using System.Linq.Expressions;
using LittleService.Domain.Entities;

namespace LittleService.Application.Mappers;

public static class OpenServiceRequestFilterPredicateBuilder
{
    private const int DefaultTimezoneOffsetMinutes = -180;

    public static bool IsValidFilter(string? filter)
    {
        if (string.IsNullOrWhiteSpace(filter))
            return true;

        return filter.Trim().ToLowerInvariant() switch
        {
            "all" or "today" or "week" => true,
            _ => false
        };
    }

    public static Expression<Func<ServiceRequest, bool>>? BuildDateFilter(
        string? filter,
        int? timezoneOffsetMinutes)
    {
        if (string.IsNullOrWhiteSpace(filter))
            return null;

        return filter.Trim().ToLowerInvariant() switch
        {
            "all" => null,
            "week" => BuildWeekFilter(),
            "today" => BuildTodayFilter(timezoneOffsetMinutes),
            _ => null
        };
    }

    private static Expression<Func<ServiceRequest, bool>> BuildWeekFilter()
    {
        var cutoff = DateTime.UtcNow.AddHours(-168);
        return sr => sr.CreatedAt >= cutoff;
    }

    private static Expression<Func<ServiceRequest, bool>> BuildTodayFilter(int? timezoneOffsetMinutes)
    {
        var offset = TimeSpan.FromMinutes(timezoneOffsetMinutes ?? DefaultTimezoneOffsetMinutes);
        var utcNow = DateTime.UtcNow;
        var localNow = utcNow + offset;
        var startUtc = localNow.Date - offset;
        var endUtc = startUtc.AddHours(24);

        return sr => sr.CreatedAt >= startUtc && sr.CreatedAt < endUtc;
    }
}
