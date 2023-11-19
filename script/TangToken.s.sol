// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TangToken.sol";

contract TangTokenScript is Script {
    function setUp() public {}

    function run() external {
        vm.startBroadcast();
        TangToken token = new TangToken("TangToken","Tang",8);
        vm.stopBroadcast();
    }
}