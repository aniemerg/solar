//@ compile-flags: -Ztypeck
interface I {
    receive(bytes2) external payable; //~ ERROR: receive ether function cannot take parameters
}

interface J is I {
    receive() external payable override;
}

contract C is J {
    receive() external payable override {}
}
