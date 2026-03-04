//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);

contract C {
    function f() pure public {
        MyCustomError << MyCustomError; //~ ERROR: cannot apply builtin operator `<<` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError >> MyCustomError; //~ ERROR: cannot apply builtin operator `>>` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError ^ MyCustomError; //~ ERROR: cannot apply builtin operator `^` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError | MyCustomError; //~ ERROR: cannot apply builtin operator `|` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError & MyCustomError; //~ ERROR: cannot apply builtin operator `&` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`

        MyCustomError * MyCustomError; //~ ERROR: cannot apply builtin operator `*` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError / MyCustomError; //~ ERROR: cannot apply builtin operator `/` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError % MyCustomError; //~ ERROR: cannot apply builtin operator `%` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError + MyCustomError; //~ ERROR: cannot apply builtin operator `+` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError - MyCustomError; //~ ERROR: cannot apply builtin operator `-` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`

        MyCustomError == MyCustomError;
        MyCustomError != MyCustomError;
        MyCustomError >= MyCustomError;
        MyCustomError <= MyCustomError;
        MyCustomError < MyCustomError;
        MyCustomError > MyCustomError;

        MyCustomError || MyCustomError; //~ ERROR: cannot apply builtin operator `||` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
        MyCustomError && MyCustomError; //~ ERROR: cannot apply builtin operator `&&` to `error MyCustomError(uint256,bool)` and `error MyCustomError(uint256,bool)`
    }
}
