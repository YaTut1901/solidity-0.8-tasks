// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract FunctionModifier {
    bool paused;
    bool locked;
    uint count;
    address addr;

    function setPaused(bool value) external {
        paused = value;
    }

    // functions dec() and inc() have the same component "require(!paused, "Paused")", but dec use modifier for code reusability
    function inc() external {
        require(!paused, "Paused");
        count++;
    }

    modifier whenNotPaused() {
        require(!paused, "Paused");
        _;
    }

    function dec() external whenNotPaused {
        require(!paused, "Paused");
        count--;
    }

    // example of sandwitch function modifier
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        count -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }

    // example of modifier with param
    modifier validAddress(address vAddr) {
        require(addr != address(0), "Not valid address");
        _;
    }

    function changeAddress(address newAddr) external validAddress(newAddr) {
        addr = newAddr;
    }
}