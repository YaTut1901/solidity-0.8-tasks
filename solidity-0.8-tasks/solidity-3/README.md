# Value Types | Solidity 0.8 

This Solidity contract, named `ValueTypes`, demonstrates the usage of various data types in Ethereum smart contracts.

### Boolean and Unsigned Integer Types

- `bool public b = true;`: Represents a boolean variable with the initial value `true`.

- `uint public u = 123;`: Represents an unsigned integer (uint) variable with the initial value `123`. uint has a range from 0 to 2^256-1.

- `uint8 public u8 = 8;`: Represents an 8-bit unsigned integer (uint8) variable with the initial value `8`. Various uint sizes are possible, e.g., uint16, uint24... up to uint256 or uint.

### Signed Integer Types

- `int public i = -123;`: Represents a signed integer (int) variable with the initial value `-123`. int has a range from -2^255 to 2^255-1, similar to uint.

- `int public minInt = type(int).min;`: Retrieves the minimum value of the int data type.

- `int public maxInt = type(int).max;`: Retrieves the maximum value of the int data type.

### Address Type

- `address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;`: Represents an Ethereum blockchain address in hexadecimal format.

### Bytes Type

- `bytes1 a1 = 0xb5;`: Represents a fixed-size byte array (`bytes1`) with the value `[10110101]`.

- `bytes1 b1 = 0x56;`: Represents another fixed-size byte array (`bytes1`) with the value `[01010110]`.

### Default Values

- `bool public defaultBoo;`: Represents a boolean variable with the default value `false`.

- `uint256 public defaultUint;`: Represents an unsigned integer variable with the default value `0`.

- `int256 public defaultInt;`: Represents a signed integer variable with the default value `0`.

- `address public defaultAddr;`: Represents an Ethereum blockchain address with the default value `0x0000000000000000000000000000000000000000`.