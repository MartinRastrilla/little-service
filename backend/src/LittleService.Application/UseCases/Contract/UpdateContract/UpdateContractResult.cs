using LittleService.Application.DTOs.Contracts;

namespace LittleService.Application.UseCases.Contract.UpdateContract;

public class UpdateContractResult
{
    public ContractDto Contract { get; set; } = null!;
}
