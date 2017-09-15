pragma solidity ^0.4.15;

/**
 * Simple tester that takes a 32 byte hash, logs it an returns it for trying
 * out send and receive of byte chunks from js clients.
 */
contract SendSha256Bytes {
	mapping (address => uint) balances;

	event LogBytes(bytes32 hashBytes);

	function sendBytes(bytes32 shaHash)
        constant
        external
        returns (bytes32)
    {
        LogBytes(shaHash);
        return shaHash;
	}
}
