// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_4 {
    function solution(uint256 number) external pure returns (uint256) {
        if (number == 0) return 0; // No hay potencia de 2 menor o igual a 0

        // Aplicamos solo los desplazamientos necesarios según el tamaño de `number`
        if (number >= 2**128) number |= number >> 128;
        if (number >= 2**64) number |= number >> 64;
        if (number >= 2**32) number |= number >> 32;
        if (number >= 2**16) number |= number >> 16;
        if (number >= 2**8) number |= number >> 8;
        if (number >= 2**4) number |= number >> 4;
        if (number >= 2**2) number |= number >> 2;
        if (number >= 2**1) number |= number >> 1;

        // Aislar el bit más significativo
        return (number + 1) >> 1;
    }
}
