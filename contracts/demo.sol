pragma solidity ^0.5.0;

contract Demo {
  uint x;

  function setX(uint _x) public {
    x = _x;
  }

  function getX() public view returns (uint) {
    return x;
  }
}

contract ExtendDemo is Demo {
  function addTwo() public returns (uint) {
    return x += 2;
  }
}
