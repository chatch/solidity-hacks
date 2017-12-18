pragma solidity ^0.4.18;

contract ViewsAndPures {

  uint constant one = 1;
  
  function pureFunc(uint _one) public pure returns (uint) {
    return _one;
  }

  function viewFunc() public view returns (uint) {
    return one;
  }

}
