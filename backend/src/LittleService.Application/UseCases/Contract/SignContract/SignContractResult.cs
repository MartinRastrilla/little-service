using LittleService.Application.DTOs.Contracts;

namespace LittleService.Application.UseCases.Contract.SignContract;

public class SignContractResult
{
    public ContractDto Contract { get; set; } = null!;
}
