// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_3 {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        require(packed.length == 9, "Invalid packed length");

        assembly {
            // Cargar los primeros 32 bytes de `packed` en memoria
            let data := mload(add(packed, 0x20))

            // Extraer `a` (primeros 2 bytes)
            a := shr(240, data) // Desplazar 240 bits a la derecha para obtener solo los primeros 2 bytes (16 bits)

            // Extraer `b` (el siguiente byte, en la tercera posición)
            b := iszero(iszero(and(shr(232, data), 0xFF)))

            // Extraer `c` (los últimos 6 bytes)
            c := and(shr(176, data), 0xFFFFFFFFFFFF) // Aplicar una máscara para obtener solo 6 bytes
        }

        return (a, b, c);
    }
}
