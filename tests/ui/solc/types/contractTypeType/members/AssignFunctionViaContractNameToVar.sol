//@ compile-flags: -Ztypeck
contract A {
    function f() external {}
    function g() external pure {}
}

contract B {
    function h() external {
        function() external f = A.f; //~ ERROR: member `f` not found on type `type(contract A)`
        function() external pure g = A.g; //~ ERROR: member `g` not found on type `type(contract A)`
    }
}
