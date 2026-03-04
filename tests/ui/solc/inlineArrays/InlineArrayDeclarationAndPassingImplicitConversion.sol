//@ compile-flags: -Ztypeck
    contract C {
        function f() public returns (uint) {
            uint8 x = 7;
            uint16 y = 8;
            uint32 z = 9;
            uint32[3] memory ending = [x, y, z]; //~ ERROR: mismatched types
            return (ending[1]);
        }
    }
