// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.11 <0.8.0;

contract CreateMe {
  uint public x;

  constructor(uint a) {
    x = a;
  }
}

contract CreateSaltedFactory {
  event Created(address);
  
  function createMeSalted(bytes32 salt, uint aNum) public {
    CreateMe me = new CreateMe{salt: salt}(aNum);
    emit Created(address(me));
  }
}
