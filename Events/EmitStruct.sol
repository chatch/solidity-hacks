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

    // emit event before a revert - prove it will not show in transaction receipt logs
    event LogOneUint(uint256 a);
    
    function emitBeforeRevert() public {
        emit LogOneUint(1);
        revert('forced error');
    }
 }
