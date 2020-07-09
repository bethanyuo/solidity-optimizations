contract MemoryOperationsDemo {
    function normalSumOfArray(uint[] arr) public view returns (uint sum) {
        for (uint i = 0; i < arr.length; i++) {
            sum = arr[i] + sum;
        }
    }
    
    function asmSumOfArray(uint[] arr) public view returns (uint sum) {
        assembly {
            let len := mload(arr)
            let elAddress := add(arr, 0x20)
            let i := 0
            
            loop:
                sum := add(sum, mload(elAddress))
                elAddress := add(elAddress, 0x20)
                
                i := add(i, 1)
                jumpi(loop, lt(i, len))
        }
    }
    
    function normalScaleArray(uint[] arr) public view returns (uint[] result) {
        for (uint i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }
        
        return arr;
    }
    
    function asmScaleArray(uint[] arr) public view returns (uint[] result) {
        assembly {
            let len := mload(arr)
            let elAddress := add(arr, 0x20)
            let i := 0
            let element := 0
            
            mstore(0x0, 0x20) // store the data type in mem[0]. 0x20 means one-dimensional dynamic array
            mstore(0x20, len) // store the length in mem[1]
            
            loop:
                element := mload(elAddress)
                element := mul(element, 2)
                
                // store element i in mem[2 + i]
                mstore(add(0x40, mul(i, 0x20)), element)
                
                elAddress := add(elAddress, 0x20)
                
                i := add(i, 1)
                jumpi(loop, lt(i, len))
                    
            // return mem[0..len+2]
            return(0x0, add(0x40, mul(len, 0x20)))
        }
    }
}