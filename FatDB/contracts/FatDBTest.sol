import 'dapple/test.sol';

import 'FatDB.sol';

contract FatDBTest is Test {
    FatDB db;

    function setUp() {
        db = new FatDB();
    }

    function testAddEntry() {
      uint EXPECTED_COUNT = 1;
      address ADDR = 0xaaaaaa8c48b2ccc4fa772469148511c7dfffffff;
      uint32 NUM = 111222333;

      db.addEntry(ADDR, NUM);

      assertEq(ADDR, db.mapKeys(0));
      assertEq(EXPECTED_COUNT, db.addCount());
      assertEq(uint(NUM), uint(db.bigAssMap(ADDR)));
    }

}
