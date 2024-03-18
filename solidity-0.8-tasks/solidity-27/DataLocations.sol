// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) structs;

    // using memory identifier in function args is needed for array, struct, string, mapping
    // "calldata" is used when we want to use variable from transaction memory directly
    // "memory" is used when we want to copy data from anywhere (typically from blockchain storage or transaction memory) and use it`s copy in function
    // "storage" for arguments is not allowed
    function examples(uint[] calldata _y, string calldata _x) external returns(bool) {
        structs[msg.sender] = MyStruct(123, "dasda"); // updating value which is stored on blockchain (contract field)
        // update will not be flushed after function call will be end, cause str is copied from values stored on chain
        MyStruct memory str = structs[msg.sender];
        str.foo = 12;

        // value is updated on chain
        MyStruct storage _str = structs[msg.sender];
        _str.foo = 12;
    }

    // "memory":
    // It can be used for both function declaration parameters as well as within the function logic
    // It is mutable (it can be overwritten and changed)
    // It is non-persistent (the value does not persist after the transaction has completed)

    // "calldata":
    // It can only be used for function declaration parameters (and not function logic)
    // It is immutable (it can't be overwritten and changed)
    // It must be used for dynamic parameters of an external function
    // It is non-persistent (the value does not persist after the transaction has completed)



    // use calldata for func parameters, storage for writing data, memory for reading
}