// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Sample {
    uint256 private v;

    constructor(uint256 _v) {
        v = _v;
    }

    function getV() external view returns(uint256) {
        return v;
    }
}

contract Deploy {
    event Deployed(address _contract);

    // contract can be deployed directly by word 'new'
    function deploy() external payable returns(address addr) {
        addr = address(new Sample(123));
    }

    // function will deploy contract from bytecode passed as argument.
    function deploy(bytes memory _code) external payable returns(address addr) {
        assembly {
            // create(b, p, v)
            // v - amount of ETH
            // p - pointer in memory to start of a code
            // n - size of code
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "deploy failed");

        emit Deployed(addr);
    }

    function getSampleBytecode(uint256 _v) external pure returns(bytes memory) {
        return abi.encodePacked(type(Sample).creationCode, abi.encode(_v));
    }
}