// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_3 {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        require(packed.length == 9, "Invalid packed length");

        // Extraer `a` (primeros 2 bytes)
        a = (uint16(uint8(packed[0])) << 8) | uint16(uint8(packed[1]));

        // Extraer `b` (el tercer byte)
        b = packed[2] != 0;

        // Extraer `c` (los últimos 6 bytes)
        c = bytes6(packed[3]) | (bytes6(packed[4]) >> 8) | (bytes6(packed[5]) >> 16) 
            | (bytes6(packed[6]) >> 24) | (bytes6(packed[7]) >> 32) | (bytes6(packed[8]) >> 40);

        return (a, b, c);
    }
}
