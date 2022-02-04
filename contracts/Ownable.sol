// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
  address private _owner;

  event OwnershipTransferred (address indexed previousOwner, address indexed newOwner);

  modifier onlyOwner() {
    require(isOwner());
    _;
  }

  constructor() {
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), msg.sender);
  }

  function owner() public view returns (address) {
    return _owner;
  }

  function isOwner() public view returns (bool) {
    return msg.sender == _owner;
  }

  function renonuceOwnership() public onlyOwner {
    _owner = address(0);
    emit OwnershipTransferred(_owner, address(0));
  }

  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  function _transferOwnership(address _newOwner) internal {
    require(_owner != address(0), "invalid address");
    emit OwnershipTransferred(_owner, _newOwner);
    _owner = _newOwner;
  }
}
