# Introduction to Functions | Solidity 0.8 

# Solidity Contract: FunctionIntro

This Solidity contract, named `FunctionIntro`, contains two external functions:

## 1. `add(uint x, uint y)`

- **Visibility:** External
- **Pure Function:** Yes
- **Parameters:**
  - `x` (uint)
  - `y` (uint)
- **Returns:** uint
- **Description:** This function takes two unsigned integer parameters, `x` and `y`, and returns their sum as an unsigned integer.

## 2. `sub(uint x, uint y)`

- **Visibility:** External
- **Pure Function:** Yes
- **Parameters:**
  - `x` (uint)
  - `y` (uint)
- **Returns:** int
- **Description:** This function takes two unsigned integer parameters, `x` and `y`, converts them to signed integers, subtracts `y` from `x`, and returns the result as a signed integer.
