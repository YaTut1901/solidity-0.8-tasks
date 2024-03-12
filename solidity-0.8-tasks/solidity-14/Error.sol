// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Error {
    // throw message if x < 10; costs 730 gas
    function requireFoo(uint x) external pure returns (uint) {
        require(x > 10, "wrong! x < 10");
    }

    // do the same as requireFoo. revert is better for conditional branching; execution costs 799 gas
    function revertFoo(uint x) external pure returns (uint) {
        if (x < 10) {
            revert("wrong! x < 10");
        }
    }

    error Err(uint, bytes);
    // do the same as functions above, but cheaper (spend less gas); costs 791 gas
    function customErrorFoo(uint x) external pure returns (uint) {
        if (x < 10) {
            revert Err(x, "wrong! x < 10");
        }
    }

    bool public somethingWentWrongFlag = false;

    // assert is used to check conditions that can`t appear in normal cases
    function assertOk() external view {
        assert(!somethingWentWrongFlag);
    }

    function broken() external {
        somethingWentWrongFlag = true;
    }
}