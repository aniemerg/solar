contract C {
    function f() public returns (uint, uint) {
        try this.f() returns (uint constant a, uint immutable b) { //~ ERROR: mutability is not allowed here
//~^ ERROR: mutability is not allowed here

        } catch Error(string memory immutable x) { //~ ERROR: mutability is not allowed here
            x;
        }

        try this.f() returns (uint a, uint b) {
        } catch (bytes memory immutable x) { //~ ERROR: mutability is not allowed here
            x;
        }

        try this.f() returns (uint a, uint b) {
        } catch Error(string memory constant x) { //~ ERROR: mutability is not allowed here
            x;
        }

        try this.f() returns (uint a, uint b) {
        } catch (bytes memory constant x) { //~ ERROR: mutability is not allowed here
            x;
        }
    }
}
