// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Enum {
    enum Status {
        None, // will have value 0
        Pending, // will have value 1
        Shipped, // will have value 2
        Canceled, // will have value 3
        Rejected // will have value 4
    }

    struct Order {
        Status status;
        address buyer;
    }
}