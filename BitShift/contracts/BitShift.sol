contract BitShift {

    bytes32 chunk = sha3('bruce lee was a goose');

    function BitShift() {
    }

    function getShiftedNums()
        constant
        returns (uint16[10])
    {
        uint16[10] memory nums;
        for (var idx = 0; idx < 10; idx++) {
            bytes memory num = new bytes(2);
            num[0] = chunk[idx];
            num[1] = chunk[idx+1];
            nums[idx] = uint16(num);
        }
        return nums;
    }

}
