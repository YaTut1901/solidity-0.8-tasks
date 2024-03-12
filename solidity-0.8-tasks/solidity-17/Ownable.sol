// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    modifier validAddress(address addr) {
        require(addr != address(0), "address not valid");
        _;
    }

    function setOwner(address newOwner) external onlyOwner validAddress(newOwner) {
        owner = newOwner;
    }
}