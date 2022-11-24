// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.6;

contract TestVariable {
    uint256 public a1;

    function setA1(uint256 _a1) public {
        a1 = _a1;
    }

    bool public b1;

    function setB1(bool _b1) public {
        b1 = _b1;
    }

    uint8 public c1;

    function plusC1() public {
        c1++;
    }

    function minusC1() public {
        c1--;
    }

    address public d1;

    function setD1(address _d1) public {
        d1 = _d1;
    }

    function getBalanceAtAddress() public view returns(uint) {
        return d1.balance;
    }
}