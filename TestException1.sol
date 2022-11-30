// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

contract ExceptionRequireExample {

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        // if의 문제점? else가 없으면 피드백 없다?
        if (_amount <= balanceReceived[msg.sender]) {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }
    }
}