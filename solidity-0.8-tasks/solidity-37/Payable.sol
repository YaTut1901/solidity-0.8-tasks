// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Payable {
    // ether can be transfered only to field declared payable
    address payable public owner;

    // payable contract allow to directly transfer ether to this contract address 
    constructor() payable {
        // payable is a type so address should be converted from regular address to payable
        owner = payable(msg.sender);
    }

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.
    function deposit() public payable {}

    // Call this function along with some Ether.
    // The function will throw an error since this function is not payable.
    function notPayable() public {}

    // Function to withdraw all Ether from this contract.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint256 amount = address(this).balance;

        // send all Ether to owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }
}