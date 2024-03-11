# Variables | Solidity 0.8 

This Solidity contract, named `StateVariables`, demonstrates the use of state and local variables. Here's an explanation of the contract:

## State Variable:

- `uint public state = 123;`: Declares a state variable named `state` as an unsigned integer, initialized with the value `123`. The `public` visibility modifier allows external access to the variable.

## Function - `foo`:

- `function foo() external view returns (uint, address, uint) {`: Declares a function named `foo`.
  - `external`: Specifies that the function can be called from outside the contract.
  - `view`: Indicates that the function does not modify the contract's state.
  - `returns (uint, address, uint)`: Specifies the return types of the function.

  Function Body:
  - `uint local = 456;`: Declares a local variable named `local` and initializes it with the value `456`. Local variables are not saved to the blockchain.
  - `local++;`: Increments the value of the local variable `local`.
  - Returns a tuple containing the values of global variables:
    - `block.timestamp`: Current timestamp of the block.
    - `msg.sender`: Address of the sender of the message.
    - `block.number`: Block number.

Note: State variables are stored on the blockchain and retain their values between function calls. In contrast, local variables exist only within the scope of the function and are not permanently stored on the blockchain.
