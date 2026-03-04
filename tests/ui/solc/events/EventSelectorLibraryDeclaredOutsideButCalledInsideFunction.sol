//@ compile-flags: -Ztypeck
library Y {
    event E() anonymous;
}

contract C {
    bytes32 s5 = Y.E.selector; //~ ERROR: member `E` not found on type `type(library Y)`

    function test2() view external returns (bytes32) {
        return s5;
    }
}
