// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_4 {
    function solution(uint256 number) external pure returns (uint256) {
        if (number == 0) return 0; // No hay potencia de 2 que sea menor o igual a 0

        // Propagación de bits hacia la derecha para llenar hasta el bit más significativo
        number |= number >> 1;
        number |= number >> 2;
        number |= number >> 4;
        number |= number >> 8;
        number |= number >> 16;
        number |= number >> 32;
        number |= number >> 64;
        number |= number >> 128;

        // Aislar el bit más significativo
        return (number + 1) >> 1;
    }
}
