var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddControllers();

// Swagger / OpenAPI
builder.Services.AddEndpointsApiExplorer(); // Allows endpoints to be discovered
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new() 
    { 
        Title = "Little Service API", 
        Version = "v1",
        Description = "API para la aplicación de servicios Little Service"
    });
});

var app = builder.Build();

// ------------------------------------
// Middleware
// ------------------------------------
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();            // Generates JSON of OpenAPI
    app.UseSwaggerUI(c =>        // Interactive web interface
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Little Service API V1");
        c.RoutePrefix = string.Empty; // Swagger at root: https://localhost:5001/
    });
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();
