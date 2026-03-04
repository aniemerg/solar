error E();
function f() public pure {
    revert E; //~ ERROR: expected `(`, found `;`
}
