// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

contract Level_0 {

  function solution() external pure returns (uint8) {
    assembly {
        mstore(0x0, 42)
        return(0x0, 32)
    }
  }
}
