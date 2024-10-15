# **Q4. Write some Yul to**

Add 0x07 to 0x08
store the result at the next free memory location.
**(optional) write this again in opcodes**



assembly {
    // PUSH values 0x07 and 0x08 onto the stack
    PUSH1 0x07
    PUSH1 0x08
    
    // ADD the two values at the top of the stack
    ADD
    
    // Load the free memory pointer from memory position 0x40
    PUSH1 0x40
    MLOAD
    
    // Store the sum (top of the stack) in memory at the free memory pointer
    MSTORE
    
    // Return the result from memory position 0x40 (32 bytes)
    PUSH1 0x20 // Size to return (32 bytes)
    PUSH1 0x40 // Memory offset to return from
    RETURN
}
