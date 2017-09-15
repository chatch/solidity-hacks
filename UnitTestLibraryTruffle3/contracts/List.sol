pragma solidity ^0.4.8;

library List {

    struct Data {
        uint[] nums;
    }

    function push(Data storage self, uint num)
        internal
    {
        self.nums.length++;
        self.nums[self.nums.length-1] = num;
    }

    function length(Data storage self)
        internal
        returns (uint length)
    {
        length = self.nums.length;
    }

}
