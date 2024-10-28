// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_2 {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray) {
        // Copiar el arreglo original en sortedArray
        for (uint i = 0; i < 10; i++) {
            sortedArray[i] = unsortedArray[i];
        }

        // Implementación de Insertion Sort
        for (uint i = 1; i < 10; i++) {
            uint key = sortedArray[i];
            uint j = i;

            // Desplazar los elementos mayores hacia la derecha
            while (j > 0 && sortedArray[j - 1] > key) {
                sortedArray[j] = sortedArray[j - 1];
                j--;
            }

            // Insertar el elemento en su posición correcta
            sortedArray[j] = key;
        }

        return sortedArray;
    }
}
