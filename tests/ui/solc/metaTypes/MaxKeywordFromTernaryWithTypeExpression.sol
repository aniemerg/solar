//@ compile-flags: -Ztypeck
contract C {
    function max(bool isUint) pure public returns (uint8) {
        return (isUint ? type(uint8) : type(int8)).max; //~ ERROR: incompatible conditional types
    }
}
