bool payable a; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
string payable b; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
int payable c; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
int256 payable d; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
uint payable e; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
uint256 payable f; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
bytes1 payable g; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
bytes payable h; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
bytes32 payable i; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
fixed payable j; //~ ERROR: only address types can have state mutability
//~^ ERROR: only constant variables are allowed at file level
fixed80x80 payable k; //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: expected one of `;` or `=`, found `k`
ufixed payable l;
ufixed80x80 payable m;

bool view a2;
string view b2;
int view c2;
int256 view d2;
uint view e2;
uint256 view f2;
bytes1 view g2;
bytes view h2;
bytes32 view i2;
fixed view j2;
fixed80x80 view k2;
ufixed view l2;
ufixed80x80 view m2;

bool pure a3;
string pure b3;
int pure c3;
int256 pure d3;
uint pure e3;
uint256 pure f3;
bytes1 pure g3;
bytes pure h3;
bytes32 pure i3;
fixed pure j3;
fixed80x80 pure k3;
ufixed pure l3;
ufixed80x80 pure m3;
