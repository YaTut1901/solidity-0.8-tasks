# View and Pure Functions | Solidity 0.8 

This Solidity contract, titled `ViewAndPureFunctions`, showcases the usage of view and pure functions alongside a state variable. Here's a breakdown of the contract:

## State Variable:

- `uint num = 1;`: Declares a state variable named `num` initialized to the value `1`.

## Function - `pureF`:

- `function pureF(uint x) external view returns (uint) {`: Declares a function named `pureF`.
  - `external`: Specifies that the function can be called from outside the contract.
  - `view`: Indicates that the function only reads data from the blockchain but does not modify it.
  - Takes an external unsigned integer parameter `x`.
  - Returns the result of adding the state variable `num` to the parameter `x`. The `view` modifier is appropriate since it doesn't alter the contract's state.

## Function - `viewF`:

- `function viewF(uint x) external pure returns (uint) {`: Declares a function named `viewF`.
  - `external`: Specifies that the function can be called from outside the contract.
  - `pure`: Signifies that the function does not manipulate any saved data on the blockchain.
  - Takes an external unsigned integer parameter `x`.
  - Increments the parameter `x` and returns the result. The `pure` modifier is suitable because this function doesn't interact with or modify the contract's state.

The contract highlights the distinction between `view` and `pure` functions, where `view` is used for functions observing blockchain data, and `pure` is applied to functions performing computations without altering stored information. This differentiation contributes to efficient and secure smart contract development on the Ethereum blockchain.