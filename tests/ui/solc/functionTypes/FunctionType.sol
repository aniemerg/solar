//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        function(uint) returns (uint) x;
        x;
    }
}
