contract Foo {
    function test() public {
        try this.f() {}
        catch Error(string reason) {} //~ ERROR: expected data location
    }

    function f() public {
    }
}
