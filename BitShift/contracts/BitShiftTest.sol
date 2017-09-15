import 'dapple/test.sol';
import 'dapple/debug.sol';

import 'BitShift.sol';

contract BitShiftTest is Test {
    BitShift bs;

    function setUp() {
        bs = new BitShift();
    }

    function testGetShiftedNums() {
        uint16[10] nums = bs.getShiftedNums();
        for (var idx = 0; idx < nums.length; idx++) {
            log_uint(uint(nums[idx]));
        }
    }

}
