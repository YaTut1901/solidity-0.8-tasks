// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract ViewAndPureFunctions {
    uint num = 1;

    // view because it reads data saved on blockchain in num var
    function pureF(uint x) external view returns (uint) {
        return num + x;
    }

    // pure because it just increment x, does not manipulate any saved data
    function viewF(uint x) external pure returns (uint) {
        return x++;
    }
}