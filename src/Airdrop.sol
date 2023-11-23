// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
event no_enough_allowance(uint256 amount, address owner, address spender);
contract Airdrop is ERC20 {
    address public contractAddress;
    constructor(string memory _name, string memory _symbol) ERC20(_name,_symbol) {
        contractAddress = address(this);
    }

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
            IERC20 token = IERC20(_token);
            uint _amountSum = getSum(_amounts);
            if(token.allowance(msg.sender,address(this)) <= _amountSum){
                emit no_enough_allowance(token.allowance(msg.sender,address(this)),msg.sender, address(this));

            }
            // 授权代币数量要大于转出代币数量 (接口调用者授权给这个合约的代币数量不能大于发行量)
            require(token.allowance(msg.sender,address(this)) > _amountSum, "Need Approve ERC20 token");
            // 本身是这个合约调用的转账请求 所以这个接口调用的时候 在ERC20内部的msg.sender是这个合约的地址而不是传入的这个msg.sender
            for (uint i = 0; i < _addresses.length; i++) {
                token.transferFrom(msg.sender,_addresses[i],_amounts[i]);
            }
        }
    
}