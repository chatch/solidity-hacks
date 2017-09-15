pragma solidity ^0.4.4;

library LinkedListOfStruct {

	struct List {
		bytes32 head;
		bytes32 tail;
		mapping (bytes32 => Entry) entries;
	}

	struct Entry {
		address account;
		uint value;                     // in wei
		bool filled;
		EntryIds ids;
	}

	struct EntryIds {
		bytes32 id;
		bytes32 next;
		bytes32 prev;
	}

	function addEntry(
        List storage self,
        address account,
        uint value)
        returns (bytes32 entryId)
    {
		entryId = sha3(account, value, block.number);

		bytes32 tail = self.tail;
		EntryIds memory ids = EntryIds(entryId, tail, 0);
		self.entries[entryId] = Entry(account, value, false, ids);

		// new tail and point existing tail to new tail
		self.tail = entryId;
		self.entries[tail].ids.prev = entryId;
    }

	function getEntry(
        List storage self,
		bytes32 entryId)
        returns (
			address account,
			uint value
		)
    {
		Entry e = self.entries[entryId];
		return (e.account, e.value);
    }

}
