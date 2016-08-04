import 'dapple/test.sol';

import 'Modifiers.sol';

contract ModifiersTest is Test {
    Modifiers m;

    function setUp() {
        m = new Modifiers();
    }

    // proves that if any modifier does not have a underscore (yield) that the
    // body of a function using the modifier will not be excuted
    function testWithoutUnderscore() {
      m.withoutUnderscore();
      assertEq(1, m.val());
    }

    function testWithUnderscore() {
      m.withUnderscore();
      assertEq(2, m.val());
    }

}
