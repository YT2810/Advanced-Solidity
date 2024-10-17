// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract returnEth {
    function getEth() public payable returns (uint256)  {
        uint256 amount;
        assembly {
            amount := callvalue()
        }
        return amount;
    }
    
}
