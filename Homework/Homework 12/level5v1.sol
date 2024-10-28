// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_5 {
    function solution(int256 a, int256 b) external pure returns (int256) {
        // Calcular el promedio usando operaciones binarias
        int256 average = (a & b) + ((a ^ b) >> 1);

        // Si `a` y `b` tienen un bit impar en su XOR, redondear hacia arriba
        if ((a ^ b) & 1 != 0) {
            average += 1;
        }

        return average;
    }
}
