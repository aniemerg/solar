//@ compile-flags: -Ztypeck
uint256 constant MAX = 1;

library L1 {
    uint256 internal constant INT = 100;
}

contract C1 {
    uint256 internal constant CONST1 = L1.INT;

    uint256[L1.INT] internal arr1; // error, backward reference
//~^ ERROR: failed to evaluate constant: unsupported expression
    uint256[L2.INT] internal arr2; // error, forward reference
//~^ ERROR: failed to evaluate constant: unsupported expression
}

contract C2 is C1 {
    uint256 internal constant CONST2 = CONST1;

    uint256[CONST1] internal arr3; // error, inherited constants
//~^ ERROR: failed to evaluate constant: unsupported expression
    uint256[CONST2] internal arr4; // error, same contract constant
//~^ ERROR: failed to evaluate constant: unsupported expression
}

library L2 {
    uint256 internal constant INT = 100;
}
