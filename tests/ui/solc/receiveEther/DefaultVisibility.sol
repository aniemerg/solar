contract C {
    // Check that visibility is also enforced for the receive ether function.
    receive() {} //~ ERROR: receive ether function must be payable
//~^ ERROR: no visibility specified
}
