//@ compile-flags: -Ztypeck
// This used to cause an internal error because of the visitation order.
contract Test {
    function createChild() public {
       Child asset = new Child();
    }
}

contract Parent {
    constructor(address _address) {}
}

contract Child is Parent { //~ ERROR: wrong number of arguments for base constructor: expected 1, found 0
}
