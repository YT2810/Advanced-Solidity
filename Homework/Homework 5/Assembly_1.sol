// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // Load the value of `mol` into a stack variable
            let molValue := mol

            // Store the `molValue` in memory at position 0x80
            mstore(0x80, molValue)

            // Return the stored value from memory (0x80) with size 32 bytes (0x20)
            return(0x80, 0x20)
        }
    }
}
