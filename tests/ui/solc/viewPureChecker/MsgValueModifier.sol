//@ compile-flags: -Ztypeck
contract C {
    modifier m(uint _amount, uint _avail) { require(_avail >= _amount); _; } //~ ERROR: no matching declarations found
    function f() m(1 ether, msg.value) public pure {}
}
