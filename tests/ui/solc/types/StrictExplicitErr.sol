//@ compile-flags: -Ztypeck
contract B{}

enum E { Zero }

contract C
{
    function f() public pure {

        uint16 a = uint16(int8(-1)); //~ ERROR: invalid explicit type conversion

        int8 b = -1;
        uint16 c = uint16(b); //~ ERROR: invalid explicit type conversion

        int8 d = int8(uint16(type(uint16).max)); //~ ERROR: invalid explicit type conversion

        uint16 e = type(uint16).max;
        int8 g = int8(e); //~ ERROR: invalid explicit type conversion

        address h = address(uint(type(uint).max)); //~ ERROR: invalid explicit type conversion

        uint i = uint(address(0)); //~ ERROR: invalid explicit type conversion

        uint j = type(uint).max;
        address k = address(j); //~ ERROR: invalid explicit type conversion

        int80 l = int80(bytes10("h")); //~ ERROR: invalid explicit type conversion
        bytes10 m = bytes10(int80(-1)); //~ ERROR: invalid explicit type conversion

        B n = B(int(100)); //~ ERROR: invalid explicit type conversion
        int o = int(new B()); //~ ERROR: invalid explicit type conversion

        B p = B(0x00); //~ ERROR: invalid explicit type conversion

        int q = int(E(0));
        int r = int(E.Zero);
    }
}
