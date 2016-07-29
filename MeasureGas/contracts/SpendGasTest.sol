import 'dapple/test.sol';

import 'SpendGas.sol';

contract SpendGasTest is Test {
    SpendGas spend;

    Tester spendTester;

    function setUp() {
        spend = new SpendGas();
    }

    function testIncrementUint32() {
        uint32 before = spend.aUint32();
        spend.incrementUint32();
        uint expected = before + 1;
        assertEq(expected, spend.aUint32());
    }

    function testIncrementUint256() {
        uint256 before = spend.aUint256();
        spend.incrementUint256();
        uint expected = before + 1;
        assertEq(expected, spend.aUint256());
    }

    function testFailAlwaysThrow() {
        spend.withAlwaysThrow();
    }
}
