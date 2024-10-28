// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_2 {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray) {
        // Copy unsortedArray to sortedArray to work with it
        for (uint i = 0; i < 10; i++) {
            sortedArray[i] = unsortedArray[i];
        }

        // Selection Sort implementation in Assembly
        assembly {
            let n := 10 
            for { let i := 0 } lt(i, sub(n, 1)) { i := add(i, 1) } {
                let minIndex := i
                for { let j := add(i, 1) } lt(j, n) { j := add(j, 1) } {
                    let current := mload(add(add(sortedArray, 0x20), mul(j, 0x20)))
                    let minimum := mload(add(add(sortedArray, 0x20), mul(minIndex, 0x20)))
                    if lt(current, minimum) {
                        minIndex := j
                    }
                }
                if iszero(eq(minIndex, i)) {
                    let temp := mload(add(add(sortedArray, 0x20), mul(i, 0x20)))
                    mstore(add(add(sortedArray, 0x20), mul(i, 0x20)), mload(add(add(sortedArray, 0x20), mul(minIndex, 0x20))))
                    mstore(add(add(sortedArray, 0x20), mul(minIndex, 0x20)), temp)
                }
            }
        }
        
        return sortedArray; 
    }
}
