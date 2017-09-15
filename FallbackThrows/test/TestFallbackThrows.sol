pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

contract FallbackThrows {
	function () payable {
		if (!msg.sender.send(100)) {
			return;
		}

	}
}

contract TrySend {
	event SendFailed();

	function sendTo(address receipient) {
		if (!receipient.send(1000)) {
			SendFailed();
		} else {
			throw;
		}
	}

	/*function sendToIgnoresThrow(address receipient) {
		receipient.send(1000);
	}*/

}

contract TestFallbackThrows {

	function testTrySend() {
  	  FallbackThrows throws = new FallbackThrows();
  	  TrySend sender = new TrySend();
  	  sender.sendTo(throws);
    }

	/*function testTrySendIgnores() {
  	  FallbackThrows throws = new FallbackThrows();
  	  TrySend sender = new TrySend();
  	  sender.sendToIgnoresThrow(throws);
    }*/

}
