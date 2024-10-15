// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract AssemblySum {

    function addAndStore() public pure returns (uint256 result) {
        assembly {
            // Add 0x07 and 0x08
            let sum := add(0x07, 0x08)
            
            // Load the free memory pointer from memory position 0x40
            let freeMemoryPointer := mload(0x40)
            
            // Store the sum in the free memory
            mstore(freeMemoryPointer, sum)
            
            // Set the result variable to the sum
            result := sum
            
            // Update the free memory pointer (move it forward by 32 bytes)
            mstore(0x40, add(freeMemoryPointer, 0x20))
        }

        // Returning result, which is set to the sum
        return result;
    }
}
