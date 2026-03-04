//@ compile-flags: -Ztypeck
library Y {
    event E() anonymous;
}

contract D {
    function test1() external pure returns (bytes32) {
        return Y.E.selector; //~ ERROR: member `E` not found on type `type(library Y)`
    }
}
