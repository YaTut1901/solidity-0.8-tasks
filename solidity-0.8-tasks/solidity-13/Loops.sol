// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Loops {
    function twoInPowerOmit3BreakOn5For(uint power) public pure returns (uint) {
        uint res = 1;
        for (uint i = 0; i <= power; i++) {
            if (i == 3) {
                continue;
            }

            if (i == 5) {
                break;
            }

            res *= 2;
        }

        return res;
    }

    function twoInPowerWhile(uint power) public pure returns (uint) {
        uint res = 1;
        uint count = 0;

        while (count < power) {
            res *= 2;
            count++;
        }

        return res;
    }
}