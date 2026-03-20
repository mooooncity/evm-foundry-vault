// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @notice Minimal pull-based ETH vault (portfolio sample).
contract EthVault {
    mapping(address => uint256) public balances;
    uint256 public totalDeposited;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    receive() external payable {
        deposit();
    }

    function deposit() public payable {
        require(msg.value > 0, "zero");
        balances[msg.sender] += msg.value;
        totalDeposited += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "zero");
        uint256 bal = balances[msg.sender];
        require(bal >= amount, "bal");
        balances[msg.sender] = bal - amount;
        totalDeposited -= amount;
        (bool ok,) = msg.sender.call{value: amount}("");
        require(ok, "xfer");
        emit Withdrawn(msg.sender, amount);
    }
}
