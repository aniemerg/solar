//@ compile-flags: -Ztypeck
contract C {
    modifier costs(uint _amount) { require(msg.value >= _amount); _; } //~ ERROR: no matching declarations found
    function f() costs(1 ether) public view {}
}
