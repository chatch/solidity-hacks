pragma solidity >=0.5.0 <0.6.0;

/**
 * Simple contract that ExtCodeHashCheck will try to identify and make a call
 * to given only an address where this contract is deployed.
 */
contract WhatAmI {
    function reveal() public pure returns (string memory) {
        return "I'm a WhatAmI contract";
    }
}
