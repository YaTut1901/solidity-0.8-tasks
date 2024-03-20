// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Wallet is ReentrancyGuard {
    error InsufficientFunds(address addr, uint256 balance);
    event Log(string msg, address caller);
    mapping(address => uint256) balances;

    fallback() external payable { 
        emit Log("fallback", msg.sender);
    }

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
    address private immutable wallet;

    constructor(address addr) {
        wallet = addr;
    }

    function balanceOf(address addr) external returns(uint256) {
        (bool success, bytes memory data) = wallet.call(abi.encodeWithSignature("balanceOf(address)", addr));
        require(success, "call balanceOf(address) failed");
        return abi.decode(data, (uint256));
    }

    function deposit() external payable returns(bool) {
        (bool success, bytes memory data) = wallet.call{ value: msg.value }(abi.encodeWithSignature("depositTo(address)", msg.sender));
        return success && abi.decode(data, (bool));
    }

    function withdraw(uint256 amount) external returns(bool) {
        (bool success, bytes memory data) = wallet.call(abi.encodeWithSignature("withdrawFrom(address,uint256)", msg.sender, amount));
        return success && abi.decode(data, (bool));
    }
}