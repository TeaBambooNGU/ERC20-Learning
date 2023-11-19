// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Airdrop is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name,_symbol) {}

    function getSum(uint256[] calldata _arr) public pure returns (uint sum) {
        for(uint i=0; i<_arr.length; i++){
            sum = sum + _arr[i];
        }
    }

    /**
     * 批量转账
     * @param _token 代币合约地址
     * @param _addresses 接收代币的地址数组
     * @param _amounts  接收代币的金额 （每个地址对应的空投数量）
     */
    function multiTransferToken (address _token, 
        address[] calldata _addresses, 
        uint256[] calldata _amounts) external {
            // 校验代币地址的数据 和 转账金额的数据 长度是否相等
            require(_addresses.length == _amounts.length,"Lengths of Addresses and Amounts NOT SAME");

        }
    
}