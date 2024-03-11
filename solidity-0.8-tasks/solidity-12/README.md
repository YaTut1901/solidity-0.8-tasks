# If Else | Solidity 0.8 

The `IfElse` Solidity contract demonstrates two different representations of conditional logic using the classic `if-else` statement and the ternary operator. Here's a concise explanation of the contract:

## Function - `foo`:

- **Classic `if-else` Representation:**
  - `function foo(uint x) public pure returns (uint) {`
  - **Conditions:**
    1. If `x` is greater than 10, return 1.
    2. Else, if `x` is greater than 5, return 2.
    3. Default case returns 0.
  - **Explanation:** This function uses the traditional `if-else` structure to define multiple conditions based on the value of the parameter `x`. The conditions are mutually exclusive, and only one branch will be executed.

## Function - `foo_2`:

- **Ternary Operator Representation:**
  - `function foo_2(uint x) public pure returns (uint) {`
  - **Ternary Operator:**
    - `return x > 10 ? 1 : (x > 5 ? 2 : 0);`
  - **Explanation:** This function employs the ternary operator (`? :`) to express the same conditions as in `foo`. The ternary operator provides a more concise representation of conditional logic, where each condition is evaluated in a nested manner.

Both representations achieve the same result, but the second function (`foo_2`) utilizes the ternary operator for a more compact syntax. The choice between these representations depends on readability preferences and coding style.