contract C {
    uint private internal a; //~ ERROR: visibility already specified
    uint private public b; //~ ERROR: visibility already specified
    uint private private c; //~ ERROR: visibility already specified
    uint internal internal e; //~ ERROR: visibility already specified
    uint internal public f; //~ ERROR: visibility already specified
    uint internal private g; //~ ERROR: visibility already specified
    uint public internal h; //~ ERROR: visibility already specified
    uint public public i; //~ ERROR: visibility already specified
    uint public private j; //~ ERROR: visibility already specified
    function f1() private external {} //~ ERROR: visibility already specified
    function f2() private internal {} //~ ERROR: visibility already specified
    function f3() private public {} //~ ERROR: visibility already specified
    function f4() private private {} //~ ERROR: visibility already specified
    function f5() external external {} //~ ERROR: visibility already specified
    function f6() external internal {} //~ ERROR: visibility already specified
    function f7() external public {} //~ ERROR: visibility already specified
    function f8() external private {} //~ ERROR: visibility already specified
    function f9() internal external {} //~ ERROR: visibility already specified
    function f10() internal internal {} //~ ERROR: visibility already specified
    function f11() internal public {} //~ ERROR: visibility already specified
    function f12() internal private {} //~ ERROR: visibility already specified
    function f13() public external {} //~ ERROR: visibility already specified
    function f14() public internal {} //~ ERROR: visibility already specified
    function f15() public public {} //~ ERROR: visibility already specified
    function f16() public private {} //~ ERROR: visibility already specified
}
