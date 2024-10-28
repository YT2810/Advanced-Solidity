// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_0 {

  function solution() external pure returns (uint8) {
    assembly {
        mstore(returndatasize(), 42)
        return(returndatasize(), 32)
    }
  }
}
