/**
 * Simple test demonstrates testing a Library contact directly in a
 * Truffle 3 solidity test.
 */
pragma solidity ^0.4.8;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/List.sol";

contract TestList {

    using List for List.Data;
    List.Data list;

    function testPush() {
        Assert.equal(list.length(), 0, "Initial length should be 0");
        list.push(100);
        Assert.equal(list.length(), 1, "Length after push should be 1");
    }

}
