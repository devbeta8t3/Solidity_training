// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.17;

contract Loop {

    function loop() public {
        //for loop
        for (uint i=0; i<10; i++) {
            if (i==3) {
                continue;
            }
            if (i==5) {
                break;
            }
        }

        uint j;
        while (j<10) {
            j++;
        }
    }
}