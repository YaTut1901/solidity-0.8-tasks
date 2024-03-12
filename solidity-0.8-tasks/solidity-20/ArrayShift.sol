// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract ArrayShift {
    uint256[] arr = [1, 2, 3, 4, 5];

    modifier inBounds(uint256 index) {
        require(index < arr.length, "index is out of bound");
        _;
    }

    function removeWithOrder(uint256 index) public inBounds(index) {
        for (uint256 i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function removeWithoutOrder(uint256 index) public inBounds(index) {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}
