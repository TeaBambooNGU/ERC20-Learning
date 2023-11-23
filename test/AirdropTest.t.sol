// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Airdrop.sol";

contract AirdropTest is Test {
    Airdrop private airdrop;
    using stdStorage for StdStorage;

    function setUp() public {
        airdrop = new Airdrop("TangAirDrop","Tang");
    }

    function testGetSum() public view {
        uint sum = 20;
        uint256[] memory array = new uint256[](3);
        array[0] = 1;
        array[1] = 9;
        array[2] = 10;
        assert (sum == airdrop.getSum(array));
    }

    function testMultiTransferToken() public  {
        address tokenAddress = 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0;

        address[] memory receiveWallets = new address[](3);
        receiveWallets[0] = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        receiveWallets[1] = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
        receiveWallets[2] = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
        uint256[] memory amounts = new uint256[](3);
        amounts[0] =  10;
        amounts[1] = 2000;
        amounts[2] = 50;
        IERC20 token = IERC20(tokenAddress);
        token.approve(airdrop.contractAddress(),30000);
        

        airdrop.multiTransferToken(tokenAddress, receiveWallets, amounts);

    }
  
}