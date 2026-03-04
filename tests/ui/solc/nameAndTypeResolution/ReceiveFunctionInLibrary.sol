//@ compile-flags: -Ztypeck
library C {
    receive() external payable {} //~ ERROR: libraries cannot have receive ether functions
}
