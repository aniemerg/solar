//@ compile-flags: -Ztypeck
contract C {
    receive(bytes2) {} //~ ERROR: receive ether function must be payable
//~^ ERROR: receive ether function cannot take parameters
//~^^ ERROR: no visibility specified
}
contract D is C {
    receive() {} //~ ERROR: receive ether function must be payable
//~^ ERROR: no visibility specified
}
