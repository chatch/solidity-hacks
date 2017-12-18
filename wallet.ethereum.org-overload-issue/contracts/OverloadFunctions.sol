pragma solidity ^0.4.18;

contract OverloadFunctions {

  event LogParams(uint one, uint two);

  function pureFunc(uint _one) public pure returns (uint) {
    return _one;
  }

  function pureFunc(uint _one, uint _two) public pure returns (uint) {
    return _one + _two;
  }

  function logFunc(uint _one) public returns (bool) {
    LogParams(_one, 0x0);
  }

  function logFunc(uint _one, uint _two) public returns (bool) {
    LogParams(_one, _two);
  }

}
