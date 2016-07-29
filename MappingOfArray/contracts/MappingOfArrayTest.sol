import 'dapple/test.sol';

import 'MappingOfArray.sol';

contract MappingOfArrayTest is Test {
    MappingOfArray c;

    function setUp() {
        c = new MappingOfArray();
    }

    function testAddNum() {
        uint8 key = 123;
        uint8 num = 11;
        assertEq(0, c.getLength(123));
        assertEq(uint(0), c.getNum(123, 0));
        c.addNum(key, num);
        assertEq(1, c.getLength(123));
        assertEq(uint(num), c.getNum(123, 0));
    }

    function testDoesntThrowSecondIndexOutOfBounds() {
        assertEq(uint(0), c.getNum(123, 0));

    }


    function testThrowsIndexOfNonExistantArray() {
        c.getNumThrows(123, 0);
    }

}
