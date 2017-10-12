pragma solidity ^0.4.15;

import "truffle/Assert.sol";

contract TestBitShiftAndSlice {
    event LogByte(byte oneByte);
    event LogBytes4(bytes4 fourBytes);

    bytes8 data8 = 0x0a0b0c0d01020304;
    bytes dataVarLen = new bytes(8);

    function beforeAll() {
        for (uint i = 0; i < 8; i++) {
            dataVarLen[i] = data8[i];
        }
    }

    // Solidity >= 0.4.7 (after shift ops supported)
    function testSimpleShifts() {
        Assert.equal(uint(1 << 1), uint(2), "should equal");
        Assert.equal(uint(1 << 8), uint(256), "should equal");
        Assert.equal(uint(256 >> 8), uint(1), "should equal");
    }

    // Solidity < 0.4.7 (before shift ops supported)
    function testSimpleShiftsWithoutShiftOperator() {
        Assert.equal(uint(1 * 2**1), uint(2), "should equal");
        Assert.equal(uint(1 * 2**8), uint(256), "should equal");
        Assert.equal(uint(256 / 2**8), uint(1), "should equal");
    }

    function testExtractByTruncate() {
        Assert.equal(bytes4(data8), bytes4(0x0a0b0c0d), "Expected first 4 bytes");
        Assert.equal(bytes1(data8), bytes1(0x0a), "Expected first byte");
    }

    function testExtractByBitShiftFromFixedBytes() {
        Assert.equal(bytes4(data8 << 32), bytes4(0x01020304), "Expected last 4 bytes");
        Assert.equal(bytes3(data8 << 20), bytes3(0xc0d010), "Expected middle 3 bytes");
    }

    function extract4Bytes(bytes data, uint pos) returns (bytes4 slice) {
        assert(pos + 4 <= data.length);
        bytes4 mask = 0;
        for (uint i = 0; i < 4; i++) {
            /*LogByte(data[i+pos]);
            LogBytes4(mask | data[i+pos]);
            LogBytes4((mask | data[i+pos]) >> (8 * i));*/
            slice = slice | bytes4((mask | (data[i+pos])) >> (8 * i));
            /*LogBytes4(slice);*/
        }
        return slice;
    }

    function testExtractByBitShiftFromVariableLengthBytes() {
        Assert.equal(extract4Bytes(dataVarLen, 0), bytes4(0x0a0b0c0d), "Expected first 4 bytes");
        Assert.equal(extract4Bytes(dataVarLen, 4), bytes4(0x01020304), "Expected last 4 bytes");
        Assert.equal(extract4Bytes(dataVarLen, 2), bytes4(0x0c0d0102), "Expected middle 4 bytes");
    }
}
