contract SpendGas {

    uint32 public aUint32;
    uint256 public aUint256;

    address[] public anArrayOfAddress;
    mapping(address => uint) public aMapOfAddressToUint;

    function SpendGas() {
    }

     modifier alwaysThrow
     {
         if (true) {
             throw;
         }
         _
     }

     function incrementUint32() {
        aUint32++;
     }

     function incrementUint256() {
        aUint256++;
     }

     function withAlwaysThrow() alwaysThrow {
        // should never reach here
        1 + 1;
     }

}
