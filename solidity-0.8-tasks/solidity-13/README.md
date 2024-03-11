# For and While Loops | Solidity 0.8 

The `Loops` Solidity contract showcases two different loop implementations, one utilizing a `for` loop with conditional statements (`twoInPowerOmit3BreakOn5For`), and the other employing a `while` loop (`twoInPowerWhile`). Here's a brief explanation of the contract:

## Function - `twoInPowerOmit3BreakOn5For`:

- **`for` Loop Implementation:**
  - `function twoInPowerOmit3BreakOn5For(uint power) public pure returns (uint) {`
  - **Loop Structure:**
    - Initializes `res` to 1 and iterates through the loop for values of `i` from 0 to `power`.
    - Omits multiplication by 2 when `i` is 3 using `continue`.
    - Breaks out of the loop when `i` is 5.
  - **Explanation:** This function calculates 2 raised to the power of `power` while skipping the multiplication by 2 when `i` is 3 and breaking the loop when `i` becomes 5.

## Function - `twoInPowerWhile`:

- **`while` Loop Implementation:**
  - `function twoInPowerWhile(uint power) public pure returns (uint) {`
  - **Loop Structure:**
    - Initializes `res` to 1 and iterates through the loop using a `while` loop until `count` reaches `power`.
  - **Explanation:** This function achieves the same result as the previous function but uses a `while` loop to calculate 2 raised to the power of `power`.

Both functions calculate 2 raised to the power of `power`, demonstrating different loop structures. The choice between `for` and `while` loops depends on coding preferences and specific use cases.

Total Symbols: 614
