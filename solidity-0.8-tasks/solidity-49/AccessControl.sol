// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AccessControl {
    bytes32 private constant ADMIN = keccak256(abi.encode("ADMIN"));
    bytes32 private constant USER = keccak256(abi.encode("USER"));

    event RoleGrantedEvent(address to, bytes32 role);
    event RoleRevokedEvent(address from, bytes32 role);
    event RoleAccessDeniedEvent(address whom, bytes32 role);

    error RoleAccessDenied(address whom, bytes32 role);

    mapping(address => mapping(bytes32 => bool)) private roles;

    constructor() {
        _updateRole(msg.sender, ADMIN, true);
    }

    modifier only(bytes32 role) {
        if (!roles[msg.sender][role]) {
            emit RoleAccessDeniedEvent(msg.sender, role);
            revert RoleAccessDenied(msg.sender, role);
        }
        _;
    }

    function _updateRole(
        address addr,
        bytes32 role,
        bool grant
    ) internal returns (bool) {
        roles[addr][role] = grant;

        if (grant) {
            emit RoleGrantedEvent(addr, role);
        } else {
            emit RoleRevokedEvent(addr, role);
        }

        return true;
    }

    function grantRole(address to, bytes32 role)
        external
        only(ADMIN)
        returns (bool)
    {
        return _updateRole(to, role, true);
    }

    function revokeRole(address from, bytes32 role)
        external
        only(ADMIN)
        returns (bool)
    {
        return _updateRole(from, role, true);
    }
}
