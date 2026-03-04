contract C {
    function f() public pure {
        (uint a, uint b, uint c); //~ ERROR: expected `=`, found `;`
    }
}
