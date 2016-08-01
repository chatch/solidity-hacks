contract FatDB {

    mapping(address => uint32) public bigAssMap;

    address[] public mapKeys;

    uint24 public addCount = 0;

    function FatDB() {
    }

    function addEntry(address _addr, uint32 _num) {
      bigAssMap[_addr] = _num;
      mapKeys.push(_addr);
      addCount++;
    }

}
