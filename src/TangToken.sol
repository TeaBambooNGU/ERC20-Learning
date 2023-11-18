// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;
import "solmate/tokens/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
error NoPayMintPrice();
error WithdrawTransfer();
error MaxSupply();
contract TangToken is ERC20,Ownable {
    uint256 public constant MINT_PRICE = 0.00000001 ether;
    uint256 public constant MAX_SUPPLY = 1_000_000_000;

    constructor (
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        address _initOwner
    ) ERC20 (_name,_symbol,_decimals) Ownable(_initOwner){}

    function mintTo(address recipient) public payable{

    }
}



