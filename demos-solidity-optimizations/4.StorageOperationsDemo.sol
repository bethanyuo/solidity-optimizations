contract StorageOperationsDemo {
    uint public x;
    uint public y;
    
    function setX(uint value) public {
        assembly {
            sstore(add(x_slot, x_offset), value)
        }
    }
    
    function setY(uint value) public {
        assembly {
            sstore(add(y_slot, y_offset), value)
        }
    }
    
    function swapXY() public {
        assembly {
            let temp := sload(add(x_slot, x_offset))
            let yVal := sload(add(y_slot, y_offset))
            sstore(add(x_slot, x_offset), yVal)
            
            sstore(add(y_slot, y_offset), temp)
        }
    }
}