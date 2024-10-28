// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_3 {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        require(packed.length == 9, "Invalid packed length");

        assembly {
            // Cargar los primeros 32 bytes de `packed` en memoria, que incluye los 9 bytes que necesitamos
            let data := mload(add(packed, 0x20))

            // Extraer `a` (primeros 2 bytes)
            a := shr(240, data) // Desplazar 240 bits a la derecha para obtener solo los primeros 2 bytes (16 bits)

            // Extraer `b` (el siguiente byte, en la tercera posición)
            b := and(shr(232, data), 0x1) // Desplazar 232 bits y aplicar AND para obtener solo el tercer byte como booleano

            // Extraer `c` (los últimos 6 bytes)
            c := shr(176, data) // Desplazar 176 bits a la derecha para obtener solo los últimos 6 bytes
        }

        // Retornar los valores desempaquetados
        return (a, b, c);
    }
}
