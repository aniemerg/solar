contract A {
    modifier mod1(string storage storage a) { _; } //~ ERROR: data location already specified
    modifier mod2(string storage memory a) { _; } //~ ERROR: data location already specified
    modifier mod3(string storage calldata a) { _; } //~ ERROR: data location already specified
    modifier mod4(string memory storage a) { _; } //~ ERROR: data location already specified
    modifier mod5(string memory memory a) { _; } //~ ERROR: data location already specified
    modifier mod6(string memory calldata a) { _; } //~ ERROR: data location already specified
    modifier mod7(string calldata storage a) { _; } //~ ERROR: data location already specified
    modifier mod8(string calldata memory a) { _; } //~ ERROR: data location already specified
    modifier mod9(string calldata calldata a) { _; } //~ ERROR: data location already specified
    modifier modA(string transient storage a) { _; } //~ ERROR: data location already specified
    modifier modB(string transient memory a) { _; } //~ ERROR: data location already specified
    modifier modC(string transient calldata a) { _; } //~ ERROR: data location already specified
    modifier modD(string storage transient a) { _; } //~ ERROR: data location already specified
    modifier modE(string memory transient a) { _; } //~ ERROR: data location already specified
    modifier modF(string calldata transient a) { _; } //~ ERROR: data location already specified
}
