pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;

contract EmitStruct {
    struct AStruct {
        uint256 one;
        uint256 two;
    }
    
    event LogStruct(AStruct a);
    
    function emitStruct() public {
        AStruct memory a = AStruct(1, 2);
        emit LogStruct(a);
    }
}

