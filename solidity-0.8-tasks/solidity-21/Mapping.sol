// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Mapping {
    mapping(address => uint) public balances;
    mapping(bytes1 => mapping(address => uint)) public userBalances;

    constructor() {
        address first = 0x71C7656EC7ab88b098defB751B7401B5f6d8976F;
        address second = 0x165CD37b4C644C2921454429E7F9358d18A45e14;
        address third = 0x2170Ed0880ac9A755fd29B2688956BD959F933F8;

        balances[first] = 1;
        balances[second] = 2;
        balances[third] = 3;
        bytes1 userName = 0xb5;

        userBalances[userName][first] = balances[first];
    }

    function get(bytes1 userName, address addr) public view returns(uint) {
        return userBalances[userName][addr];
    }

    function get(bytes1 userName, address addr, uint value) public {
        userBalances[userName][addr] = value;
    }
}