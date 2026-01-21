using Microsoft.EntityFrameworkCore;
using System.Net;
using System.Text.Json;
using LittleService.Domain.Exceptions;

namespace LittleService.Api.Middleware;

/// <summary>
/// Middleware to handle exceptions globally and convert them to appropriate HTTP responses.
/// </summary>
public class GlobalExceptionHandlerMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<GlobalExceptionHandlerMiddleware> _logger;

    public GlobalExceptionHandlerMiddleware(RequestDelegate next, ILogger<GlobalExceptionHandlerMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "An exception occurred: {Message}", ex.Message);
            await HandleExceptionAsync(context, ex);
        }
    }

    private static Task HandleExceptionAsync(HttpContext context, Exception exception)
    {
        var (statusCode, errorCode, message) = GetExceptionDetails(exception);

        context.Response.StatusCode = (int)statusCode;
        context.Response.ContentType = "application/json";

        var response = new
        {
            error = new
            {
                code = errorCode,
                message = message,
                timestamp = DateTime.UtcNow
            }
        };

        var jsonResponse = JsonSerializer.Serialize(response, new JsonSerializerOptions
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        });

        return context.Response.WriteAsync(jsonResponse);
    }

    private static (HttpStatusCode StatusCode, string? ErrorCode, string Message) GetExceptionDetails(Exception exception)
    {
        return exception switch
        {
            // Domain exceptions - business logic violations
            DomainException domainEx => (HttpStatusCode.BadRequest, domainEx.ErrorCode, domainEx.Message),

            // Entity Framework exceptions
            DbUpdateException dbEx when dbEx.InnerException?.Message.Contains("duplicate") == true
                => (HttpStatusCode.Conflict, "DUPLICATE_ENTRY", "Ya existe un registro con estos datos"),

            DbUpdateException dbEx
                => (HttpStatusCode.BadRequest, "DATABASE_ERROR", "Error al guardar los datos"),

            // Authentication/Authorization exceptions
            UnauthorizedAccessException
                => (HttpStatusCode.Unauthorized, "UNAUTHORIZED", "No autorizado para realizar esta acción"),

            // Not found exceptions (you could create a custom NotFoundException if needed)
            KeyNotFoundException
                => (HttpStatusCode.NotFound, "NOT_FOUND", "Recurso no encontrado"),

            // Argument exceptions
            ArgumentException argEx
                => (HttpStatusCode.BadRequest, "INVALID_ARGUMENT", argEx.Message),

            // Default - unexpected exceptions
            _ => (HttpStatusCode.InternalServerError, "INTERNAL_ERROR",
                "Ocurrió un error inesperado. Por favor, intente más tarde.")
        };
    }
}