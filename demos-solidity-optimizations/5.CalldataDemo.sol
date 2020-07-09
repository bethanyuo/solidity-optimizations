contract CalldataDemo {
    function sumArrayPublic(uint[] arr) public view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        
        return sum;
    }

    function sumArrayExternal(uint[] arr) external view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        
        return sum;
    }
    
    function scaleArrayPublic(uint[] arr) public returns (uint[]) {
        for (uint i = 0; i < arr.length; i++) {
            arr[i] *= 2;
        }
        
        return arr;
    }
    
    // function scaleArrayExternal(uint[] arr) external returns (uint[]) {
    //     for (uint i = 0; i < arr.length; i++) {
    //         // This will not work. calldata is read-only in external functions
    //         arr[i] *= 2;
    //     }
        
    //     return arr;
    // }
}