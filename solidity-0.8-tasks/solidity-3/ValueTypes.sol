// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

// Data types - values and references

contract ValueTypes {
    bool public b = true;
    uint public u = 123; // uint = uint256, values 0 to 2^256-1
    uint8 public u8 = 8; // uint8, values 0 to 2^8-1; uint16, uint24... uint8*n to uint256 or uint
    int public i = -123; // int = int256, values -2^255 to 2^255-1, same as for uint
    int public minInt = type(int).min; // get min value of type int
    int public maxInt = type(int).max; // get max value of type int
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; // hexadecimal variable representing blockchain address
    
    /*
    In Solidity, the data type byte represent a sequence of bytes. 
    Solidity presents two type of bytes types :

     - fixed-sized byte arrays
     - dynamically-sized byte arrays.
     
     The term bytes in Solidity represents a dynamic array of bytes. 
     It’s a shorthand for byte[] .
    */
    bytes1 a1 = 0xb5; //  [10110101]
    bytes1 b1 = 0x56; //  [01010110]

    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}