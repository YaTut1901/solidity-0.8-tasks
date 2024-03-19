// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Z {
    event Log(string msg);

    function foo() public virtual {
        emit Log("Z.foo");
    }
}

contract A is Z {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function foo() public override virtual {
        emit Log("A.foo");
        Z.foo();
    }
}

contract B is Z{
    string public text;

    constructor(string memory _text) {
        text = _text;
    }

    function foo() public override virtual {
        emit Log("A.foo");
        Z.foo();
    }
}

// inheritance should be declared in order from more base contract to more specific
contract C is A("asd"), B("asdd") { // first way to provide parent constructor argument
    function foo() public override(A, B) {
        A.foo(); // only specified implementation will be called
    }
}

contract D is A, B { // second way to provide parent constructor argument
    constructor() A("asd") B("asdas") {
    }

    function foo() public override(A, B) {
        super.foo(); // implementations for foo() from both A and B will be called
    }
}

// order of constructors initialization is from base inherited one to the most specific. Actual contract is initialized the last