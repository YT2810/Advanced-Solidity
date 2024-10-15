// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract DeployRevert {
    uint256 value1;

    // Constructor that triggers a revert if the condition is met
    constructor(bool shouldRevert) {
        // If 'shouldRevert' is true, the contract will revert during deployment
        if (shouldRevert) {
            revert("Init code reverted: Revert triggered in constructor");
        }
        // If no revert, set value1 to 17
        value1 = 17;
    }

    // Function to read the stored value
    function read() public view returns (uint256 result) {
        return value1;
    }
}


