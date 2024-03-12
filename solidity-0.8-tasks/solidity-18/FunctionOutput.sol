// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract FunctionOutput {
    // function returns 2 output values - uint and bool
    function multiple() public pure returns(uint, bool) {
        return(1, true);
    }

    // function returns 2 values that in outputs will have names
    function named() public pure returns(uint x, bool b) {
        return(1, true);
    }

    // function omit return statement, but assign values to returns() declared vars
    function assigned() public pure returns(uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructuringAssignment() external pure returns(uint x, bool b) {
        (uint _x, bool _b) = multiple();
        (uint __x , bool __b) = named();
        return (_x, __b);
    }
}