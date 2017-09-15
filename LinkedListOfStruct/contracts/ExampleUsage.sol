pragma solidity ^0.4.4;

import "./LinkedListOfStruct.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract ExampleUsage {
	event Added(bytes32 entryId);

	using LinkedListOfStruct for LinkedListOfStruct.List;
	mapping (uint => LinkedListOfStruct.List) mapToLists;

	function ExampleUsage() {
	}

	function addEntry(
		uint listId,
		address entryAccount,
		uint entryValue
	)
		returns(bytes32 entryHash)
	{
		LinkedListOfStruct.List list = mapToLists[listId];
		entryHash = list.addEntry(entryAccount, entryValue);
		Added(entryHash);
	}

	function getEntry(
		uint listId,
		bytes32 entryHash
	)
		constant
		returns (
			address account,
			uint value
		)
	{
		LinkedListOfStruct.List list = mapToLists[listId];
		return list.getEntry(entryHash);
	}

}
