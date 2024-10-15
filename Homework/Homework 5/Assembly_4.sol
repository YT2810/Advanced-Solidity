// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        // Modify state of the count variable from within
        // the assembly segment
        assembly {
            // Load the current value of `count` from storage slot 0
            let currentValue := sload(0)

            // Add `num` to the current value of `count`
            let newValue := add(currentValue, num)

            // Store the new value back to storage slot 0 (count)
            sstore(0, newValue)
        }
    }
}
