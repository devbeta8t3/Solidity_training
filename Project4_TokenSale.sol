// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

interface I_ERC20 {
    function transfer(address _to, uint amount) external;
    function decimals() external view returns(uint);
}


contract TokenSale {

    uint tokenPriceInWei = 1 ether;

    I_ERC20 token;

    constructor(address _token) {
        token = I_ERC20(_token);
    }

    function purchase() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money to send");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;

        token.transfer(msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder); // send the rest back
    }
}