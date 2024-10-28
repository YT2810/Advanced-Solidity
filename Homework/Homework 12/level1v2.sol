// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_1 {
    function solution(
        uint256[2][3] calldata, // Eliminamos el nombre para evitar advertencias
        uint256[2][3] calldata  // Eliminamos el nombre para evitar advertencias
    ) external pure returns (uint256[2][3] memory result) {
        assembly {
            // Allocate memory for result array
            result := mload(0x40)
            mstore(0x40, add(result, 0xc0)) // Adjust the free memory pointer
            
            // Define offsets for x and y in calldata
            let x := 0x04
            let y := 0x64  // y starts 96 bytes (0x60) after x

            // Calculate and store each element in result
            mstore(result, add(calldataload(x), calldataload(y)))
            mstore(add(result, 0x20), add(calldataload(add(x, 0x20)), calldataload(add(y, 0x20))))
            mstore(add(result, 0x40), add(calldataload(add(x, 0x40)), calldataload(add(y, 0x40))))
            mstore(add(result, 0x60), add(calldataload(add(x, 0x60)), calldataload(add(y, 0x60))))
            mstore(add(result, 0x80), add(calldataload(add(x, 0x80)), calldataload(add(y, 0x80))))
            mstore(add(result, 0xa0), add(calldataload(add(x, 0xa0)), calldataload(add(y, 0xa0))))
        }
    }
}
