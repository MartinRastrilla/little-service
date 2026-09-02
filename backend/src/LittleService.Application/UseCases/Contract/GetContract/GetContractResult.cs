using LittleService.Application.DTOs.Contracts;

namespace LittleService.Application.UseCases.Contract.GetContract;

public class GetContractResult
{
    public ContractDto Contract { get; set; } = null!;
}
