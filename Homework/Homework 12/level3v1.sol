// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_3 {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        assembly {
            // Cargar los primeros 32 bytes de `packed` en memoria
            let data := mload(add(packed, 0x20))

            // Extraer `a` (primeros 2 bytes) desplazando 240 bits hacia la derecha
            a := shr(240, data) 

            // Extraer `b` (el siguiente byte, en la tercera posición)
            b := iszero(iszero(and(shr(232, data), 0xFF)))

            // Extraer `c` (los últimos 6 bytes)
            c := shr(176, data)
        }
    }
}
