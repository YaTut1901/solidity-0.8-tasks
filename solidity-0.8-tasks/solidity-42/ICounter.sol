// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ICounter {
    error OverflowError(uint256 currentValue);
    function dec() external returns(bool);
    function dec(uint256 value) external returns(bool);
    function inc() external returns(bool);
    function inc(uint256 value) external returns(bool);
    function getCounter() external view returns(uint256);
}