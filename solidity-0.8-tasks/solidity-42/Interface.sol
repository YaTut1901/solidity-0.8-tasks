// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./ICounter.sol";

contract InterfaceCall {
    ICounter private immutable counter;

    constructor(address addr) {
        counter = ICounter(addr);
    }

    function getCounter() external view returns(uint256) {
        return counter.getCounter();
    }

    function dec(uint256 value) external returns(bool) {
        return counter.dec(value);
    }

    function inc(uint256 value) external returns(bool) {
        return counter.inc(value);
    }
}