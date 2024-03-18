// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract A {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract B {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// inheritance should be declared in order from more base contract to more specific
contract C is A("asd"), B("asdd") { // first way to provide parent constructor argument
}

contract D is A, B { // second way to provide parent constructor argument
    constructor() A("asd") B("asdas") {
    }
}

// order of constructors initialization is from base inherited one to the most specific. Actual contract is initialized the last