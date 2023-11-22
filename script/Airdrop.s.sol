// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Airdrop.sol";

contract AirdropScript is Script {
    function setUp() public{}

    function run() external{
        vm.startBroadcast();
        Airdrop airdrop = new Airdrop("TangAirdrop","tangDrop");
        vm.stopBroadcast();
    }
}