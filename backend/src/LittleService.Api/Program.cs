using System.Text;
using LittleService.Api.Middleware;
using LittleService.Application.Interfaces.Services;
using LittleService.Application.Mappers;
using LittleService.Domain.Interfaces.Repositories;
using LittleService.Infrastructure.Persistence;
using LittleService.Infrastructure.Persistence.Seeders;
using LittleService.Infrastructure.Services;
using LittleService.Infrastructure.Storage;
using Mediator;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;

var builder = WebApplication.CreateBuilder(args);
var jwtKey = builder.Configuration["Jwt:Key"] ?? "YourSuperSecretKeyForJWT123456789012345";
var jwtIssuer = builder.Configuration["Jwt:Issuer"] ?? "LittleService";

// Authentication
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = jwtIssuer,
            ValidAudience = jwtIssuer,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey))
        };
    });

builder.Services.AddControllers();

//? Database
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

//? Infrastructure and Services
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IPasswordHasher, PasswordHasher>();
builder.Services.AddScoped<ITokenGenerator, JwtTokenGenerator>();
builder.Services.AddScoped<IRefreshTokenService, RefreshTokenService>();
builder.Services.AddScoped<IAuthTokenIssuer, AuthTokenIssuer>();

//? Mediator (discovers handlers from Application assembly)
builder.Services.AddMediator(options => options.ServiceLifetime = ServiceLifetime.Scoped);

//? File Storage
builder.Services.AddScoped<IFileStorageService, LocalFileStorage>();
builder.Services.AddScoped<ServiceRequestSummaryMapper>();
builder.Services.AddScoped<FreelancerWorkItemSummaryMapper>();

//? Swagger / OpenAPI
builder.Services.AddEndpointsApiExplorer(); // Allows endpoints to be discovered
builder.Services.AddSwaggerGen(options =>
{
    options.OperationFilter<LittleService.Api.Filters.MultipartFormDataOperationFilter>();
    options.SchemaFilter<LittleService.Api.Filters.FileUploadSchemaFilter>();
    options.SwaggerDoc("v1", new()
    {
        Title = "Little Service API",
        Version = "v1",
        Description = "API para la aplicación de servicios Little Service"
    });

    //? Add security to the Swagger
    options.AddSecurityDefinition("Bearer", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        In = Microsoft.OpenApi.Models.ParameterLocation.Header,
        Name = "Authorization",
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\""
    });

    options.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement
    {
        {
            new Microsoft.OpenApi.Models.OpenApiSecurityScheme
            {
                Reference = new Microsoft.OpenApi.Models.OpenApiReference
                {
                    Type = Microsoft.OpenApi.Models.ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    });
});
var app = builder.Build();

//? Seed database
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    try
    {
        var context = services.GetRequiredService<AppDbContext>();
        //? Apply migrations
        await context.Database.MigrateAsync();

        //? Seed database
        var unitOfWork = services.GetRequiredService<IUnitOfWork>();
        var passwordHasher = services.GetRequiredService<IPasswordHasher>();
        var logger = services.GetRequiredService<ILogger<DatabaseSeeder>>();
        var loggerFactory = services.GetRequiredService<ILoggerFactory>();
        var seeder = new DatabaseSeeder(
            unitOfWork,
            passwordHasher,
            app.Environment.IsDevelopment(),
            logger,
            loggerFactory);
        await seeder.SeedAsync();
    }
    catch (Exception ex)
    {
        var logger = services.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "Error al ejecutar migraciones o seeders");
        throw;
    }
}

// ------------------------------------
// Middleware
// ------------------------------------

//? Global Exception Handler (must be placed before other middleware)
app.UseMiddleware<GlobalExceptionHandlerMiddleware>();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Little Service API v1");
    });
}


//? File Storage
app.UseStaticFiles();

app.UseAuthentication();
app.UseAuthorization();

app.UseHttpsRedirection();
app.MapControllers();

app.MapGet("/api/health", () => Results.Ok(new { status = "healthy", timestamp = DateTime.UtcNow }));
app.MapGet("/api/hello", () => Results.Ok("Hello from Little Service API"));

app.Run();
