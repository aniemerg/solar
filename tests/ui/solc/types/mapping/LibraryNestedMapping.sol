//@ compile-flags: -Ztypeck
pragma abicoder               v2;
library L {
    struct S { mapping(uint => uint) m; }
    function f(S memory a) external pure returns (S memory) {} //~ ERROR: type `struct L.S memory` is only valid in storage because it contains a (nested) mapping
//~^ ERROR: type `struct L.S memory` is only valid in storage because it contains a (nested) mapping
}
