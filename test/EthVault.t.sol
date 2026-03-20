// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {EthVault} from "../src/EthVault.sol";

contract EthVaultTest is Test {
    EthVault vault;

    function setUp() public {
        vault = new EthVault();
    }

    function testDepositWithdraw() public {
        vm.deal(address(this), 5 ether);
        vault.deposit{value: 2 ether}();
        assertEq(vault.balances(address(this)), 2 ether);
        vault.withdraw(1 ether);
        assertEq(vault.balances(address(this)), 1 ether);
    }
}
