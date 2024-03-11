// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract IfElse {

    // classic condition representation
    function foo(uint x) public pure returns (uint) {
        if(x > 10) {
            return 1;
        } else if (x > 5) {
            return 2;
        }

        return 0;
    }

    // ternary operator condition representation
    function foo_2(uint x) public pure returns (uint) {
        return x > 10 ? 1 : (x > 5 ? 2 : 0);
    }
}