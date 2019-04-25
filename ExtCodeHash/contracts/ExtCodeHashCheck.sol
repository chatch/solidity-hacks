pragma solidity >=0.5.0 <0.6.0;

import "./WhatAmI.sol";

contract ExtCodeHashCheck {
    bytes32 whatAmICodeHash;

    constructor(bytes32 _codeHash) public {
        whatAmICodeHash = _codeHash;
    }

    /**
     * Lookup and compare code hash to identify it
     */
    function whatAmIInstanceCodeHash(address _addr) public view returns (bytes32 codeHash) {
        /* solium-disable security/no-inline-assembly */
        assembly {
			codeHash := extcodehash(_addr)
        }
    }

    /**
     * Lookup and compare code hash to identify it
     */
    function isAWhatAmI(address _addr) public view returns (bool) {
        return whatAmIInstanceCodeHash(_addr) == whatAmICodeHash;
    }

    /**
     * Check contract at _addr and call it and return the result if contract
     * is a WhatAmI. Otherwise return empty string.
     */
    function callIfWhatAmI(address _addr) public view returns (string memory) {
        return isAWhatAmI(_addr) ? WhatAmI(_addr).reveal() : "";
    }
}
