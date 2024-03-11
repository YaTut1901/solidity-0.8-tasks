# Counter | Solidity 0.8 Application 

This Solidity contract, named `Counter`, is a simple implementation of a counter with increment and decrement functionalities. The contract includes the following components:

## State Variable:

- `int public count = 0;`: Declares a public state variable named `count` initialized to 0. It is accessible externally.

## Functions:

1. **`inc() external`**:
   - Increments the `count` state variable by 1 when called externally.

2. **`dec() external`**:
   - Decrements the `count` state variable by 1 when called externally.

The contract enables external users to interact with the counter by incrementing and decrementing its value. The `public` modifier on the `count` variable allows external access, and the functions modify the state variable accordingly.

Total Symbols: 578
