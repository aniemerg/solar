//@ compile-flags: -Ztypeck
// This used to crash in certain compiler versions.
contract CrashContract {
       struct S { uint a; }
       S x;
       function f() public {
               (x, x) = 1(x, x); //~ ERROR: expected function, found `int_literal[1]`
       }
}
