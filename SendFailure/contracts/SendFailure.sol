contract EventfulSendFailure {
    event LogBal(uint _bal);
}

contract SendFailure is EventfulSendFailure {

    address burn = 0xdead;

    function sendToBadAddress() returns(bool) {
        LogBal(this.balance);
        LogBal(burn.balance);
        bool success = burn.send(1);
        LogBal(this.balance);
        LogBal(burn.balance);
        return success;
    }

}
