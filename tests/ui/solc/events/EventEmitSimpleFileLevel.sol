//@ compile-flags: -Ztypeck
event E();

contract C {
    function f() public {
        emit E();
    }
}
