// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

contract TestCon {
    string public str1 = "hello";

    function setStr1(string memory _str1) public {
        str1 = _str1;
    }
}