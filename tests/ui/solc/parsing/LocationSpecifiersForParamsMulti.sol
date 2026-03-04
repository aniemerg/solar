contract Foo {
    function f(uint[] storage memory constant x, uint[] memory calldata y) internal { } //~ ERROR: data location already specified
//~^ ERROR: data location already specified
//~^^ ERROR: mutability is not allowed here
    function f2(uint[] storage storage x) internal { } //~ ERROR: data location already specified
    function f3(uint[] storage calldata x) internal { } //~ ERROR: data location already specified
    function f4(uint[] memory storage x) internal { } //~ ERROR: data location already specified
    function f5(uint[] memory memory x) internal { } //~ ERROR: data location already specified
    function f6(uint[] calldata storage x) internal { } //~ ERROR: data location already specified
    function f7(uint[] calldata memory x) internal { } //~ ERROR: data location already specified
    function f8(uint[] calldata calldata x) internal { } //~ ERROR: data location already specified
}
