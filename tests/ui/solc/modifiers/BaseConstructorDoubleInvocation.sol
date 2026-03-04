contract C { constructor(uint a) {} }
contract B is C {
    constructor() C(2) C(2) {} //~ ERROR: base constructor arguments given twice
}
