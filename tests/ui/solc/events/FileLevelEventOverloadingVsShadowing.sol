//@ compile-flags: -Ztypeck
event E();

contract C {
    event E(uint);

    function f() public {
        emit E(); //~ ERROR: wrong argument count for function call: 0 arguments given but expected 1
        emit E(1);
    }
}
