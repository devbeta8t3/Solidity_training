// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

contract EtherUnits {
    uint public onWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
}