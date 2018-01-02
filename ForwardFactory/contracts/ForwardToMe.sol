pragma solidity ^0.4.18;

contract ForwardToMe {
    uint public num;
    uint public constructorArgValue;
    
    function ForwardToMe(uint _arg) public {
        constructorArgValue = _arg;
    }

    function storeStuff(uint _num) public {
        num = _num;
	}

    function return2Vars() public pure returns (uint one, uint two) {
        return (1, 2);
	}
}
