contract Foo {
    uint[] m_x;
    function f() public view {
        uint[] storage memory x = m_x; //~ ERROR: data location already specified
        uint[] memory storage calldata y; //~ ERROR: data location already specified
//~^ ERROR: data location already specified
        uint[] storage calldata x2; //~ ERROR: data location already specified
        uint[] storage storage x3; //~ ERROR: data location already specified
        uint[] calldata memory x4; //~ ERROR: data location already specified
        uint[] calldata calldata x5; //~ ERROR: data location already specified
        uint[] calldata storage x6; //~ ERROR: data location already specified
        uint[] storage memory x4; //~ ERROR: data location already specified
        uint[] storage calldata x5; //~ ERROR: data location already specified
        uint[] storage storage x6; //~ ERROR: data location already specified
        x; y;
    }
}
