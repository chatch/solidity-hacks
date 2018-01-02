pragma solidity ^0.4.15;

contract ForwardToMe {
    uint public num;

    function storeStuff(uint _num) public {
        num = _num;
	}

    function return2Vars() public pure returns (uint one, uint two) {
        return (1, 2);
	}
}
