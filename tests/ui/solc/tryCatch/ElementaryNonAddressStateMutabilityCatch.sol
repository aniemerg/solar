contract C {
    function a() public pure {
        try this.a() {} catch (string payable memory) {} //~ ERROR: only address types can have state mutability
    }
    function c() public pure {
        try this.c() {} catch (bytes payable memory) {} //~ ERROR: only address types can have state mutability
    }
}
contract C2 {
    function a() public pure {
        try this.a() {} catch (string view memory) {} //~ ERROR: only address types can have state mutability
    }
    function c() public pure {
        try this.c() {} catch (bytes view memory) {} //~ ERROR: only address types can have state mutability
    }
}
contract C3 {
    function a() public pure {
        try this.a() {} catch (string pure memory) {} //~ ERROR: only address types can have state mutability
    }
    function c() public pure {
        try this.c() {} catch (bytes pure memory) {} //~ ERROR: only address types can have state mutability
    }
}
