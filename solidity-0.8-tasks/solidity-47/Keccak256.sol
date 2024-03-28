// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Keccak {
    function hash(string memory str, uint256 x, string memory _str) external pure returns(bytes32 res) {
        res = keccak256(abi.encodePacked(str, x, _str));
    }

    function encode(string memory str, string memory _str) external pure returns(bytes32 res) {
        res = keccak256(abi.encode(str, _str));
    }

    function encodePacked(string memory str, string memory _str) external pure returns(bytes32 res) {  // packed function executes using minimal memory to produce encoded value, then not packed produce 32 bytes including encoded value and zero padding
        res = keccak256(abi.encodePacked(str, _str));
    }

    // encoding 2 dynamic values together when encodePacked is used may produce collision. for example: keccak256(abi.encodePacked("AA", "ADDD")) => 0x181f6c0a965f252dc6b45eb1e4690341a764cbfe10ee2a8b0ebdedaacf86b8f0, keccak256(abi.encodePacked("AAA", "DDD")) => 0x181f6c0a965f252dc6b45eb1e4690341a764cbfe10ee2a8b0ebdedaacf86b8f0
}