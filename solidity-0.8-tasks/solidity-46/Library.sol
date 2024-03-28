// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library Math { // library is not allowed to have state variables
    function max(uint256 x, uint256 y) internal pure returns(uint256) {
        return x > y ? x : y;
    }
}

contract Test {
    using Math for uint256;
    
    function max(uint256 x, uint256 y) external pure returns(uint256) {
        return Math.max(x, y);
    }

    function maxUsing(uint256 x, uint256 y) external pure returns(uint256) {
        return x.max(y);
    }
}