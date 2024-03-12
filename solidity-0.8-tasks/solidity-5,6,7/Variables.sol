// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract StateVariables {
    // saved to blockchain
    uint public state = 123;

    function foo() external view returns (uint, address, uint) {
        // not saved to blockchain
        uint local = 456;

        local++;
        // returns values of global variables, msg.sender is an address of wallet who deployed the contract
        return (block.timestamp, msg.sender, block.number);
    }
}