// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract RemoveByValueAndKeepOrder {
    uint[] public items;

    // Initialize the array with some values
    constructor() {
        items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    }

    // Function to delete a specific value and keep the array ordered
    function deleteByValueAndKeepOrder(uint value) public {
        // Find the index of the value to be deleted
        uint index = find(value);

        // Ensure the value exists in the array
        require(index < items.length, "Value not found");

        // Shift all elements from the index to the left to fill the gap
        for (uint i = index; i < items.length - 1; i++) {
            items[i] = items[i + 1];
        }

        // Remove the last element, as it has been moved
        items.pop();
    }

    // Helper function to find the index of a given value
    function find(uint value) internal view returns (uint) {
        for (uint i = 0; i < items.length; i++) {
            if (items[i] == value) {
                return i;
            }
        }
        return items.length; // Return out of bounds if value is not found
    }

    // Get the entire array
    function getItems() public view returns (uint[] memory) {
        return items;
    }
}
