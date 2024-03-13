// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import {IERC20, IERC20Errors} from "./IERC20.sol";

contract ERC20 is IERC20, IERC20Errors {
    uint256 private _totalSupply;
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    modifier validAddress(address _addr) {
        if (_addr == address(0)) {
            revert ERC20InvalidAddress(_addr, "Invalid address");
        }
        _;
    }

    modifier sufficientBalance(address _addr, uint256 amount) {
        if (amount > balances[_addr]) {
            revert ERC20InsufficientBalance(_addr, balances[_addr], amount);
        }
        _;
    }

    function name() external pure returns (string memory) {
        return "Solidity52";
    }

    function symbol() external pure returns (string memory) {
        return "SOL52";
    }

    function decimals() external pure returns (uint8) {
        return 18;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner)
        external
        view
        validAddress(_owner)
        returns (uint256 balance)
    {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value)
        external
        validAddress(_to)
        sufficientBalance(msg.sender, _value)
        returns (bool success)
    {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        external
        validAddress(_from)
        validAddress(_to)
        sufficientBalance(_from, _value)
        returns (bool success)
    {
        if (allowances[_from][msg.sender] >= _value) {
            revert ERC20InsufficientAllowance(
                _from,
                msg.sender,
                allowances[_from][msg.sender],
                _value
            );
        }

        allowances[_from][msg.sender] -= _value;
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
        external
        validAddress(_spender)
        sufficientBalance(_spender, _value)
        returns (bool success)
    {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender)
        external
        view
        validAddress(_owner)
        validAddress(_spender)
        returns (uint256 remaining)
    {
        return allowances[_owner][_spender];
    }

    function mint(address _to, uint256 _value)
        external
        validAddress(_to)
        returns (bool)
    {
        balances[_to] += _value;
        _totalSupply += _value;
        emit Transfer(address(0), _to, _value);
        return true;
    }

    function burn(address _from, uint256 _value)
        external
        validAddress(_from)
        returns (bool)
    {
        balances[_from] -= _value;
        _totalSupply -= _value;
        emit Transfer(address(0), _from, _value);
        return true;
    }
}
