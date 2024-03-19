// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./ICounter.sol";

contract Counter is ICounter {
    uint256 private counter;

    constructor() {
        counter = 0;
    }

    modifier notOverflow(uint256 value, bool addition) {
        if (addition && type(uint256).max - value < counter) {
            revert OverflowError(counter);
        }
        if (!addition && value > counter) {
            revert OverflowError(counter);
        }
        _;
    }

    function getCounter() external view returns(uint256) {
        return counter;
    }

    function dec() external notOverflow(1, false) returns(bool) {
        counter--;
        return true;
    }

    function dec(uint256 value) external notOverflow(value, false) returns(bool) {
        counter -= value;
        return true;
    }

    function inc() external notOverflow(1, true) returns(bool) {
        counter++;
        return true;
    }

    function inc(uint256 value) external notOverflow(value, true) returns(bool) {
        counter += value;
        return true;
    }
}