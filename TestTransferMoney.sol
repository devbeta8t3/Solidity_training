// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestTransferMoney {
    // 주어는 스마트계약 계정

    uint public smartBalance;

    address owner;

    bool paused;

    constructor() public {
        owner = msg.sender;
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "you are not a owner");
        selfdestruct(_to);
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "you are not a owner");
        paused = _paused;
    }

    function withdrawMoneyTo2(address payable _to) public {
        require(msg.sender == owner, "you are not a owner!!");
        require(!paused, "contract is paused!!");
        _to.transfer(this.getBalance());
    }

    function receiveMoney() public payable {
        smartBalance += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable _to = payable(msg.sender);
        _to.transfer(this.getBalance());
    }

    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}