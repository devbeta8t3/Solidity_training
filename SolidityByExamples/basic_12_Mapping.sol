// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

contract Mapping {
    //Mapping from address to uint
    mapping (address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        //Mapping은 항상 값을 리턴한다.
        //값이 설정되어 있지 않으면, 디폴트 값을 리턴할 것이다.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // 해당 주소의 값을 업데이트
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // 값을 디폴트 값으로 리셋
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    // 중첩 매핑 (주소에서 다른 매핑으로 매핑)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr][_i];
    }

    function set(address _addr, uint _i, bool _boo) public {
        nested[_addr][_i] = _boo;
    }

    function remove(address _addr, uint _i) public {
        delete nested[_addr][_i];
    }
}