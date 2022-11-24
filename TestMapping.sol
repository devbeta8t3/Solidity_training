// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

contract TestMapping {

    mapping (uint => bool) public m1;

    function setValueM1(uint _key) public {
        m1[_key] = true;
    }
}