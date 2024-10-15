// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on underflow it returns 0,
    // otherwise it should return x - y.
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        assembly {
            // Check if x is less than y (underflow)
            if lt(x, y) {
                // If underflow occurs, return 0
                mstore(0x0, 0)
                return(0x0, 32)
            }
            // If no underflow, return x - y
            let result := sub(x, y)
            mstore(0x0, result)
            return(0x0, 32)
        }
    }
}
