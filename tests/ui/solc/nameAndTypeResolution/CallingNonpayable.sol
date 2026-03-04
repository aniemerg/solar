//@ compile-flags: -Ztypeck
contract receiver { function nopay() public {} }
contract test {
    function f() public { (new receiver()).nopay{value: 10}(); }
    function g() public { (new receiver()).nopay.value(10)(); } //~ ERROR: member `value` not found on type `function ()`
}
