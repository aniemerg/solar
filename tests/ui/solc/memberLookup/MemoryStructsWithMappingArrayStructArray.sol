//@ compile-flags: -Ztypeck
contract Test {
	struct S1 { uint8 a; mapping(uint => uint)[] b1; uint8 c; }
	struct S2 { uint8 a; S1[] b2; uint8 c; }
	S2 s2;
    function f() public {
        S2 memory x = s2; //~ ERROR: type `struct Test.S2 memory` is only valid in storage because it contains a (nested) mapping
        x.b2.length;
        x.b2[1].b1[2][3];
    }
}
