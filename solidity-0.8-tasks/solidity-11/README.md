# Constants | Solidity 0.8 

The provided Solidity code comprises two contracts, `Constants` and `Variables`, each involving the assignment of an Ethereum address. Here's a concise explanation of both contracts:

## Constants Contract:

- **`Constants` Contract Overview:**
  - **Gas Cost:** Retrieving the address using the `get addr` operation incurs a constant gas cost of 351.
  - **Explanation:** The address is declared as a public constant, ensuring its immutability. Constant variables are stored directly in the bytecode, resulting in lower gas costs for access operations.

## Variables Contract:

- **`Variables` Contract Overview:**
  - **Gas Cost:** Retrieving the address using the `get addr` operation incurs a gas cost of 2483.
  - **Explanation:** The address is stored in a public state variable, allowing it to be changed. State variables require additional gas for access operations compared to constant variables.

These contracts highlight the trade-off between using constant and variable storage for Ethereum addresses, with constant variables offering lower gas costs for read operations due to their immutability. Considerations about gas efficiency are crucial in optimizing smart contract deployment on the Ethereum blockchain.
