// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

// Solidity supports enumerables and they are useful to model choice and keep track of state.
// 솔리디티는 enum(나열, 열거)를 지원하고 이것은 모델 선택 및 상태 추적에 용이하다.
// Enums can be declared outside of a contract.
// 컨트랙트 밖에서 선언 가능하다.
contract Enum {
    // Enum representing shipping status
    // 선적 상태를 나타내는 Enum
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is the first element listed in definition of the type, in this case "Pending"
    // 기본값은 유형 정의에 나열된 첫 번째 요소이며, 이 경우 "Pending".
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    // uint를 입력하여 상태 업데이트
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    // 아래와 같이 특정 enum으로 업데이트 할 수 있다.
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    // 첫번째값(0)으로 리셋
    function reset() public {
        delete status;
    }
}