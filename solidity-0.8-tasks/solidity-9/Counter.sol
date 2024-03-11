// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Counter {
    int public count = 0;

    function inc() external {
        count++;
    }

    function dec() external {
        count--;
    }
}