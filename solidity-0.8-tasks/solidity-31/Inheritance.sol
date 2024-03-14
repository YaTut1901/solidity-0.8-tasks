// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract A {
    function foo() external pure virtual returns(string memory) {
        return "foo";
    }

    function bar() external pure returns(string memory) {
        return "bar";
    }
}

contract B is A{
    function foo() external pure override virtual returns(string memory) {
        return "foo";
    }

    // function bar() external pure override returns(string memory) {
    //     return "bar";
    // } do not compile
}

contract C is B {
    function foo() external pure override returns(string memory) {
        return "foo";
    } 
    // contains both foo() and bar()
}