contract C {
    address public payable a; //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: expected one of `;` or `=`, found `a`
}
