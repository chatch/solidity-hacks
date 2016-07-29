contract MappingOfArray {

    mapping(uint8 => uint8[]) public addressToArray;

    function addNum(uint8 _key, uint8 _num)  {
        addressToArray[_key].push(_num);
    }

    function getNum(uint8 _key, uint8 _idx) returns (uint8) {
        if (addressToArray[_key].length == 0)
            return 0;
        return addressToArray[_key][_idx];
    }

    // exception if you try to access index of an array that doesn't exist
    // instead see getNum() which checks the length before indexing into the arr
    function getNumThrows(uint8 _key, uint8 _idx) returns (uint8) {
        return addressToArray[_key][_idx];
    }

    function getLength(uint8 _key) returns (uint) {
        return addressToArray[_key].length;
    }

}
