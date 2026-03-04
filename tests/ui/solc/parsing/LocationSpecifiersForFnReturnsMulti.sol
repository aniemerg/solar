contract Foo {
    function f1() returns (string calldata calldata) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f2() returns (string calldata memory) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f3() returns (string calldata storage) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f4() returns (string memory calldata) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f5() returns (string memory memory) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f6() returns (string memory storage) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f7() returns (string storage calldata) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f8() returns (string storage memory) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
    function f9() returns (string storage storage) {} //~ ERROR: data location already specified
//~^ ERROR: no visibility specified
}
