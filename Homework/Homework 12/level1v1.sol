// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_1 {
    function solution(
        uint256[2][3] calldata, // Nombre de variable eliminado para evitar advertencias
        uint256[2][3] calldata  // Nombre de variable eliminado para evitar advertencias
    ) external pure returns (uint256[2][3] memory result) {
        assembly {
            // Asignar memoria para 'result'
            result := mload(0x40)
            mstore(0x40, add(result, 0xc0))

            // Desplazamientos base para x y y en calldata
            let x_base := 0x04
            let y_base := add(x_base, 0x60) // y comienza 0x60 bytes después de x

            // Sumar elementos de x y y en result, respetando la estructura 2x3
            mstore(result, add(calldataload(x_base), calldataload(y_base)))
            mstore(add(result, 0x20), add(calldataload(add(x_base, 0x20)), calldataload(add(y_base, 0x20))))
            
            mstore(add(result, 0x40), add(calldataload(add(x_base, 0x40)), calldataload(add(y_base, 0x40))))
            mstore(add(result, 0x60), add(calldataload(add(x_base, 0x60)), calldataload(add(y_base, 0x60))))
            
            mstore(add(result, 0x80), add(calldataload(add(x_base, 0x80)), calldataload(add(y_base, 0x80))))
            mstore(add(result, 0xa0), add(calldataload(add(x_base, 0xa0)), calldataload(add(y_base, 0xa0))))
        }
    }
}

