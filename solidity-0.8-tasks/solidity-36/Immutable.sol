// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Imm {
    address private immutable owner; // spends significantly less gas then usual fields declaration.balance
    // the only difference between immutable and constant is that constant should have inline intialization while immutable can be initializaed only once anywhere in the contract

    constructor() {
        owner = msg.sender;
    }
}