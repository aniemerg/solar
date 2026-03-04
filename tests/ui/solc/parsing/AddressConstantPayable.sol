contract C {
    address constant payable b = address(0); //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: expected one of `;` or `=`, found `b`
}
