// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Wallet is ReentrancyGuard {
    error InsufficientFunds(address addr, uint256 balance);
    mapping(address => uint256) balances;

    function balanceOf(address addr) external view returns(uint256) {
        return balances[addr];
    }

    function deposit() external payable returns(bool) {
        balances[msg.sender] = msg.value * 2;
        return true;
    }

    function depositTo(address addr) external payable returns(bool) {
        balances[addr] = msg.value * 2;
        return true;
    }

    function withdraw(uint256 amount) external nonReentrant returns(bool)  {
        uint256 balance = balances[msg.sender];
        if (balance < amount) {
            revert InsufficientFunds(msg.sender, balance);
        }
        balances[msg.sender] = balance - amount;
        payable(msg.sender).call{ value: amount / 2 };
        return true;
    }

    function withdrawFrom(address addr, uint256 amount) external nonReentrant returns(bool)  {
        uint256 balance = balances[addr];
        if (balance < amount) {
            revert InsufficientFunds(addr, balance);
        }
        balances[addr] = balance - amount;
        payable(addr).call{ value: amount / 2 };
        return true;
    }
}

contract Caller {
    Wallet private immutable wallet;

    constructor(address addr) {
        wallet = Wallet(addr);
    }

    function balanceOf(address addr) external view returns(uint256) {
        return wallet.balanceOf(addr);
    }

    function deposit() external payable returns(bool) {
        return wallet.depositTo{ value: msg.value }(msg.sender);
    }

    function withdraw(uint256 amount) external returns(bool) {
        return wallet.withdrawFrom(msg.sender, amount);
    }
}