pragma solidity ^0.4.15;

/**
 * Simple tester that takes a 32 byte hash, logs it an returns it for trying
 * out send and receive of byte chunks from js clients.
 */
contract SendSha256Bytes {
	event LogBytes(bytes32 hashBytes);

    bytes32 hash;

    function sendHash(bytes32 _shaHash)
        returns (bytes32)
    {
        LogBytes(_shaHash);
        hash = _shaHash;
        return _shaHash;
	}

    function isMatch(bytes32 _preimage)
        constant
        returns (bool)
    {
        LogBytes(_preimage);
        LogBytes(hash);
        return sha256(_preimage) == hash;
	}

    function sha256Me(bytes32 _shaMe)
        constant
        returns (bytes32 result)
    {
        LogBytes(_shaMe);
        result = sha256(_shaMe);
        LogBytes(result);
    }

}
