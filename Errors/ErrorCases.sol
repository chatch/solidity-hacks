pragma solidity 0.5.12;

/**
 * Contract to trigger some error transactions and look at the response.
 */
contract ErrorCases {
    uint256 public aNum = 0;

    function revertsWithReason() public {
        aNum = 1;
        revert('reverting from revert() to test error response');
    }

    function revertsWithoutReason() public {
        aNum = 1;
        revert();
    }

    /**
     * Gas: 23534
     */
    function simpleStateUpdateNoResponse() public {
        aNum = 2;
    }

    /**
     * Gas: 23559
     */
    function simpleStateUpdateWithResponse() public returns (uint256) {
        aNum = 2;
        return aNum;
    }

}

