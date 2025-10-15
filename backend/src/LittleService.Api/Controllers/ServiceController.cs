using System.Security.Claims;
using LittleService.Application.DTOs;
using LittleService.Application.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace LittleService.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ServiceController : ControllerBase
{
    private readonly IServiceService _serviceService;

    public ServiceController(IServiceService serviceService)
    {
        _serviceService = serviceService;
    }

    // GET: api/services
    [HttpGet]
    [Authorize]
    public async Task<ActionResult<IEnumerable<ServiceResponseDto>>> GetAll()
    {
        return Ok(await _serviceService.GetAllServicesAsync());
    }

    // GET: api/services/{id}
    [HttpGet("{id}")]
    [Authorize]
    public async Task<ActionResult<ServiceResponseDto>> GetById(Guid id)
    {
        var service = await _serviceService.GetServiceByIdAsync(id);
        if (service is null)
        {
            return NotFound();
        }
        return Ok(service);
    }

    // POST: api/services
    [HttpPost]
    [Authorize]
    public async Task<ActionResult<ServiceResponseDto>> Create([FromBody] CreateServiceDto createServiceDto)
    {
        //? Get user id from token
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (userId is null)
        {
            return Unauthorized();
        }
        var service = await _serviceService.CreateServiceAsync(createServiceDto, Guid.Parse(userId));
        return CreatedAtAction(nameof(GetById), new { id = service.Id }, service);
    }

    // PUT: api/services/{id}
    [HttpPut("{id}")]
    [Authorize]
    public async Task<ActionResult<ServiceResponseDto>> Update(Guid id, [FromBody] UpdateServiceDto updateServiceDto)
    {
        //? Get user id from token
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (userId is null)
        {
            return Unauthorized();
        }
        var service = await _serviceService.GetServiceByIdAsync(id);
        if (service is null)
        {
            return NotFound();
        }
        if (service.UserId != Guid.Parse(userId))
        {
            return Forbid();
        }
        var updatedService = await _serviceService.UpdateServiceAsync(id, updateServiceDto);
        return Ok(updatedService);
    }

    // DELETE: api/services/{id}
    [HttpDelete("{id}")]
    [Authorize]
    public async Task<ActionResult<ServiceResponseDto>> Delete(Guid id)
    {
        //? Get user id from token
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (userId is null)
        {
            return Unauthorized();
        }
        var deleted = await _serviceService.DeleteServiceAsync(id);
        if (!deleted)
        {
            return NotFound();
        }
        return NoContent();
    }


}