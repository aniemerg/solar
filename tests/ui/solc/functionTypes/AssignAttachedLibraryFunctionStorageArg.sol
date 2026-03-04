//@ compile-flags: -Ztypeck
library D { struct s { uint a; } function mul(s storage self, uint x) public returns (uint) { return self.a *= x; } }
contract C {
    using D for D.s;
    D.s x;
    function f(uint a) public returns (uint) {
        function (D.s storage, uint) returns (uint) g = x.mul; //~ ERROR: invalid data location `storage`
        g(x, a);
        g(a);
    }
}
