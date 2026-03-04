//@ compile-flags: -Ztypeck
type MyInt is int;
function test() pure {
    function (MyInt) returns (int) f = MyInt.unwrap; //~ ERROR: mismatched types
    function (int) returns (MyInt) g = MyInt.wrap; //~ ERROR: mismatched types
}
