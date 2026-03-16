using Microsoft.AspNetCore.Http;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace LittleService.Api.Filters;

/// <summary>
/// Maps IFormFile properties to OpenAPI type string/format binary so Swagger can generate
/// the schema for form DTOs that contain file uploads.
/// </summary>
public class FileUploadSchemaFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema schema, SchemaFilterContext context)
    {
        if (context.Type == null)
            return;

        foreach (var prop in context.Type.GetProperties())
        {
            if (!typeof(IFormFile).IsAssignableFrom(prop.PropertyType))
                continue;

            var propName = prop.Name;
            if (schema.Properties != null && schema.Properties.ContainsKey(propName))
            {
                schema.Properties[propName] = new OpenApiSchema { Type = "string", Format = "binary" };
            }
        }
    }
}
