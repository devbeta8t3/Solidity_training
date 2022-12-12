// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

contract Array {
    // 배열을 초기화하는 몇가지 방법
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // 고정 사이즈 배열은 모든 원소가 0으로 초기화
    uint[10] public MyFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity는 전체 배열을 리턴할 수 있다.
    // 하지만, 이 함수는 길이가 무한정 커질수 있는 배열을 피해야한다.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // 배열에 추가하기
        // 배열 길이 1 증가
        arr.push(i);
    }

    function pop() public {
        // 배열의 마지막 원소를 삭제
        // 배열의 길이 1 감소
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Delete는 배열의 길이를 변화시키지 않는다.
        // 해당 인덱스의 값을 초기화시킨다. (이 경우 0)
        delete arr[index];
    }

    function example() external {
        // 메모리에 배열을 생성, 고정길이만 생성할 수 있다.
        uint[] memory a = new uint[](5);
    }

}

contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        // _index 번째 요소의 값을 +1번째 요소의 값으로 변경 (반복) 
        for (uint i=_index; i<arr.length-1; i++) {
            arr[i] = arr[i+1];
        }
        // 마지막 요소를 삭제
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        // [1,2,4,5]

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        //[]

        assert(arr.length == 0);
    }
}

contract ArrayReplaceFromEnd {
    uint[] public arr;

    // 배열에서 요소를 삭제하는 것은 gap을 발생시킨다
    // 배열을 컴팩트하게 유지하는 한 가지 요령: 마지막 요소를 삭제할 위치로 이동
    function remove(uint index) public {
        // 지울놈 값을 마지막 요소 값으로 변경
        arr[index] = arr[arr.length - 1];
        // 마지막 요소 삭제
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}// 이건 왜 쓰는거...? 순서 상관없을때 쓰는건가..