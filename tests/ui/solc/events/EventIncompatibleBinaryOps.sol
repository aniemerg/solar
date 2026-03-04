//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);
    function f() pure public {
        MyCustomEvent << MyCustomEvent; //~ ERROR: cannot apply builtin operator `<<` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent >> MyCustomEvent; //~ ERROR: cannot apply builtin operator `>>` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent ^ MyCustomEvent; //~ ERROR: cannot apply builtin operator `^` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent | MyCustomEvent; //~ ERROR: cannot apply builtin operator `|` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent & MyCustomEvent; //~ ERROR: cannot apply builtin operator `&` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`

        MyCustomEvent * MyCustomEvent; //~ ERROR: cannot apply builtin operator `*` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent / MyCustomEvent; //~ ERROR: cannot apply builtin operator `/` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent % MyCustomEvent; //~ ERROR: cannot apply builtin operator `%` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent + MyCustomEvent; //~ ERROR: cannot apply builtin operator `+` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent - MyCustomEvent; //~ ERROR: cannot apply builtin operator `-` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`

        MyCustomEvent == MyCustomEvent;
        MyCustomEvent != MyCustomEvent;
        MyCustomEvent >= MyCustomEvent;
        MyCustomEvent <= MyCustomEvent;
        MyCustomEvent < MyCustomEvent;
        MyCustomEvent > MyCustomEvent;

        MyCustomEvent || MyCustomEvent; //~ ERROR: cannot apply builtin operator `||` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
        MyCustomEvent && MyCustomEvent; //~ ERROR: cannot apply builtin operator `&&` to `event C.MyCustomEvent(uint256)` and `event C.MyCustomEvent(uint256)`
    }
}
