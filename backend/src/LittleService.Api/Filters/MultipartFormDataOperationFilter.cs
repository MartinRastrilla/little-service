using Microsoft.AspNetCore.Http;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace LittleService.Api.Filters;

/// <summary>
/// Documents operations that use [FromForm] with a type containing IFormFile as multipart/form-data
/// so Swagger UI can display the form and file upload correctly.
/// </summary>
public class MultipartFormDataOperationFilter : IOperationFilter
{
    public void Apply(OpenApiOperation operation, OperationFilterContext context)
    {
        var formParameter = context.ApiDescription.ParameterDescriptions
            .FirstOrDefault(p => p.Source == Microsoft.AspNetCore.Mvc.ModelBinding.BindingSource.Form);

        if (formParameter?.Type == null)
            return;

        if (!HasIFormFileProperty(formParameter.Type))
            return;

        var properties = formParameter.Type.GetProperties();
        var schemaProperties = new Dictionary<string, OpenApiSchema>();
        foreach (var prop in properties)
        {
            if (typeof(IFormFile).IsAssignableFrom(prop.PropertyType))
            {
                schemaProperties[prop.Name] = new OpenApiSchema { Type = "string", Format = "binary" };
            }
            else
            {
                schemaProperties[prop.Name] = new OpenApiSchema { Type = "string" };
            }
        }

        operation.RequestBody = new OpenApiRequestBody
        {
            Content = new Dictionary<string, OpenApiMediaType>
            {
                ["multipart/form-data"] = new OpenApiMediaType
                {
                    Schema = new OpenApiSchema
                    {
                        Type = "object",
                        Properties = schemaProperties
                    }
                }
            }
        };
    }

    private static bool HasIFormFileProperty(Type type)
    {
        return type.GetProperties()
            .Any(p => typeof(IFormFile).IsAssignableFrom(p.PropertyType));
    }
}
