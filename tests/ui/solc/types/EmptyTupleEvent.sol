//@ compile-flags: -Ztypeck
contract C {
    event SomeEvent();
    function a() public {
        (emit SomeEvent(), 7); //~ ERROR: expected one of `(`, `+`, `,`, `[`, `delete`, `new`, `payable`, `type`, elementary type name, identifier, or literal, found keyword `emit`
    }
}
