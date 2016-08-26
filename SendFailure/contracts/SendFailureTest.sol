import 'dapple/test.sol';

import 'SendFailure.sol';

contract SendFailureTest is Test, EventfulSendFailure {
    SendFailure sf;

    function setUp() {
        sf = new SendFailure();
        sf.send(10);
    }

    function testSendToBadAddress() {
        expectEventsExact(sf);
        // actually this passes in Dapple:
        bool success = sf.sendToBadAddress();
        LogBal(10);
        LogBal(0);
        LogBal(9);
        LogBal(1);
    }

}
