// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    function has(Role storage _role, address _account) internal view returns (bool) {
        require(_account != address(0));
        return _role.bearer[_account];
    }

    function add(Role storage _role, address _account) internal {
        require(_account != address(0));
        require(!has(_role, _account), "account already exists");
        _role.bearer[_account] = true;
    }

    function remove(Role storage _role, address _account) internal {
        require(_account != address(0));
        require(has(_role, _account), "failed to remove");
        _role.bearer[_account] = false;
    }
}