pragma solidity ^0.4.15;

contract OverloadFunctionsOle {

  event LogParams(uint one, uint two);

  function constFunc(uint _one) public constant returns (uint) {
    return _one;
  }

  function constFunc(uint _one, uint _two) public constant returns (uint) {
    return _one + _two;
  }

  function logFunc(uint _one) public returns (bool) {
    LogParams(_one, 0x0);
  }

  function logFunc(uint _one, uint _two) public returns (bool) {
    LogParams(_one, _two);
  }

}
