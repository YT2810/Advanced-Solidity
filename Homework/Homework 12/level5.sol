// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_5 {
    function solution(int256 a, int256 b) external pure returns (int256) {
        // Calcular las mitades de `a` y `b` para evitar overflow
        int256 halfA = a / 2;
        int256 halfB = b / 2;

        // Calcular el promedio inicial
        int256 average = halfA + halfB;

        // Si `a` o `b` son impares, ajustamos el promedio sumando 1 para redondear hacia arriba
        if ((a % 2 != 0) || (b % 2 != 0)) {
            average += 1;
        }

        return average;
    }
}
