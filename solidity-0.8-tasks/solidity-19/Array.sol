// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract Array {
    // create dynamic array (elements can be added to nums)
    uint[] public nums = [1, 2, 3];
    // create fixed size array, contract will not compile if initialize array with more elements then stated in declaration
    uint[3] public arr = [1, 2, 3];

    function push() external {
        nums.push(4); // nums = [1, 2, 3, 4]
        // arr.push(); contract will not compile cause arr is fixed size
    }

    function get() external view returns(uint) {
        return nums[0]; // return element with index 0 from nums
    }

    function update() external {
        nums[0] = 2; // nums = [2, 2, 3, 4]
    }

    function delet() external {
        delete nums[0]; // nums = [0, 2, 3, 4]; delete keyword clean element with index and set it to default value
    }

    function pop() external {
        nums.pop(); // nums = [0, 2, 3]
    }

    function length() external view returns(uint) {
        return nums.length; // 3
    }

    function memoryArr() external pure {
        uint[] memory a = new uint[](5); // create array in memory of VM executing this contract, means value IS NOT STORED ON BLOCKCHAIN
    }

    // declaring function with return type defined like memory make function to take value stored on blockchain, copy it and return it`s value
    function returnMemoryArr() external view returns(uint[] memory){
        return nums;
    }
}