// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract WalletImpl1 {
    uint256 private id;
    address private owner;
    mapping(address => uint256) private accounts;

    function addAccount(address addr) external payable returns(bool) {
        accounts[addr] = msg.value / 3 * 7;
        return true;
    }
}

contract WalletImpl2 {
    uint256 private id;
    address private owner;
    mapping(address => uint256) private accounts;

    function addAccount(address addr) external payable returns(bool) {
        accounts[addr] = msg.value / 2 * 5;
        return true;
    }
}

contract Proxy {
    uint256 private id;
    address private owner;
    mapping(address => uint256) private accounts;

    function addAccount(address _contract, address addr) external payable returns(bool) {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("addAccount(address)", addr)
        );
        return success && abi.decode(data, (bool));    
    }

    function getBalance(address addr) external view returns(uint256) {
        return accounts[addr];
    }
}