contract C {
    bool payable a; //~ ERROR: only address types can have state mutability
    string payable b; //~ ERROR: only address types can have state mutability
    int payable c; //~ ERROR: only address types can have state mutability
    int256 payable d; //~ ERROR: only address types can have state mutability
    uint payable e; //~ ERROR: only address types can have state mutability
    uint256 payable f; //~ ERROR: only address types can have state mutability
    bytes1 payable g; //~ ERROR: only address types can have state mutability
    bytes payable h; //~ ERROR: only address types can have state mutability
    bytes32 payable i; //~ ERROR: only address types can have state mutability
    fixed payable j; //~ ERROR: only address types can have state mutability
    fixed80x80 payable k; //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: expected one of `;` or `=`, found `k`
    ufixed payable l;
    ufixed80x80 payable m;
}
contract C2 {
    bool view a;
    string view b;
    int view c;
    int256 view d;
    uint view e;
    uint256 view f;
    bytes1 view g;
    bytes view h;
    bytes32 view i;
    fixed view j;
    fixed80x80 view k;
    ufixed view l;
    ufixed80x80 view m;
}
contract C3 {
    bool pure a;
    string pure b;
    int pure c;
    int256 pure d;
    uint pure e;
    uint256 pure f;
    bytes1 pure g;
    bytes pure h;
    bytes32 pure i;
    fixed pure j;
    fixed80x80 pure k;
    ufixed pure l;
    ufixed80x80 pure m;
}
