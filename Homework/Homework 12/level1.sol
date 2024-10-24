// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Isolution1 {
    function solution(
        uint256[2][3] calldata /*x*/, 
        uint256[2][3] calldata /*y*/
    ) external pure returns (uint256[2][3] memory);
}

contract MatrixAdditionYul is Isolution1 {
    function solution(
        uint256[2][3] calldata x, 
        uint256[2][3] calldata y
    ) external pure override returns (uint256[2][3] memory result) {
        assembly {
            // Allocate memory for the result (6 elements, each 32 bytes)
            result := mload(0x40)
            mstore(0x40, add(result, 0xc0)) // Allocate 6 * 32 bytes (0xc0 = 192 bytes)

            // Pointers to x and y in calldata
            let xPtr := add(calldataload(0x04), 0x20)  // Skip selector and array length for x
            let yPtr := add(calldataload(0x04), 0xe0)  // y starts 0xc0 (192 bytes) after x

            // Loop through the 6 elements of the 2x3 matrices
            for { let i := 0 } lt(i, 6) { i := add(i, 1) } {
                let xElement := calldataload(add(xPtr, mul(i, 0x20)))
                let yElement := calldataload(add(yPtr, mul(i, 0x20)))
                
                // Add the corresponding elements and store the result in memory
                mstore(add(result, mul(i, 0x20)), add(xElement, yElement))
            }
        }
    }
}

