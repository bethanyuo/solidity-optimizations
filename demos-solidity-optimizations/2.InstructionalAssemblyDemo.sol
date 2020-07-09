contract InstructionalAssemblyDemo {
    function assemblyLoop() public view returns (uint result) {
        assembly {
            let i := 0
            loop:
                result := add(result, i)
                i := add(i, 1)
                jumpi(loop, lt(i, 10))
        }
    }
    
    function instrAssemblyLoop() public view returns (uint result) {
        assembly {
            0 // push i to stack
            10 // push count to stack
            
            loop:
                // result := add(result, i)
                dup3 // push result to stack
                dup3 // push i to stack
                add // add(result, i)
                swap3 // set the new value of result
                pop // pop old value of result
                          
                // i := add(i, 1)
                dup2 // push i to stack
                1 // push 1 to stack
                add // add(i, 1)
                swap2 // set new value of i
                pop // pop old value of i
                
                // lt(i, 10)
                dup1 // push length to stack
                dup3 // push i to stack
                lt // lt(i, 10)
                
                // jumpi(loop, lt(i, 10))
                loop
                jumpi
                
            pop // clean count
            pop // clean i
        }
    }
}