// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    mapping(address => uint) public indexes;
    address[] public keys;

    constructor() {
        address zero = address(0);
        keys = [zero];
        balances[zero] = 0;
        inserted[zero] = true;
        indexes[zero] = 0;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "not valid address");
        _;
    }

    modifier notEmpty() {
        require(length() != 0, "collection is empty");
        _;
    }

    function set(address _key, uint _value) external validAddress(_key) {
        balances[_key] = _value;

        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
            indexes[_key] = keys.length - 1; 
        }
    } 

    function length() public view returns(uint) {
        return keys.length - 1;  // not includes default zero address element
    }

    function get(address _key) external view validAddress(_key) notEmpty returns(uint) {
        return balances[_key];
    }

    function first() external view notEmpty returns(address addr, uint balance) {
        return (keys[1], balances[keys[1]]);
    }

    function last() external view notEmpty returns(address addr, uint balance) {
        return (keys[keys.length - 1], balances[keys[keys.length - 1]]);
    }

    function clear() notEmpty external {
        for (uint i = keys.length - 1; i >= 1; i--) {
            balances[keys[i]] = 0;
            inserted[keys[i]] = false;
            indexes[keys[i]] = 0;
            keys.pop();
        }
    }

    function remove(address _key) external notEmpty validAddress(_key) {
        if(indexes[_key] == keys.length - 1) {
            keys.pop();
        } else {
            address last = keys[keys.length - 1];
            keys[keys.length - 1] = _key;
            keys[indexes[_key]] = last;
            indexes[last] = indexes[_key];
            keys.pop();
        }

        delete balances[_key];
        delete inserted[_key];
        delete indexes[_key];
    }

    function contains(address _key) external view notEmpty validAddress(_key) returns(bool) {
        return inserted[_key];
    }
}