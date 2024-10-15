// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract Deploy1{

    uint256 value1;

    constructor(){
        value1 = 17;
    }

    function read() view public returns (uint256 result){
        return value1;
    }
}