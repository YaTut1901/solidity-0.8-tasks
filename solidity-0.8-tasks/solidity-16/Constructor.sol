// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Constructor {
    uint public x;
    address owner;

    //on deploy of this contract var owner will be set to the value of wallet who deployed the contract
    constructor(uint _x) {
        x = _x;
        owner = msg.sender;
    }
}