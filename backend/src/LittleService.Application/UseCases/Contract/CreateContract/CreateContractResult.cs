using LittleService.Application.DTOs.Contracts;

namespace LittleService.Application.UseCases.Contract.CreateContract;

public class CreateContractResult
{
    public ContractDto Contract { get; set; } = null!;
}
