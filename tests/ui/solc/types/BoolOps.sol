//@ compile-flags: -Ztypeck
contract C {
    function f(bool a, bool b) public pure {
        bool c;
        // OK
        c = !a;
        c = !b;
        c = a == b;
        c = a != b;
        c = a || b;
        c = a && b;

        // Not OK
        c = a > b; //~ ERROR: cannot apply builtin operator `>` to `bool` and `bool`
        c = a < b; //~ ERROR: cannot apply builtin operator `<` to `bool` and `bool`
        c = a >= b; //~ ERROR: cannot apply builtin operator `>=` to `bool` and `bool`
        c = a <= b; //~ ERROR: cannot apply builtin operator `<=` to `bool` and `bool`
        c = a & b; //~ ERROR: cannot apply builtin operator `&` to `bool` and `bool`
        c = a | b; //~ ERROR: cannot apply builtin operator `|` to `bool` and `bool`
        c = a ^ b; //~ ERROR: cannot apply builtin operator `^` to `bool` and `bool`
        c = ~a; //~ ERROR: cannot apply unary operator `~` to `bool`
        c = ~b; //~ ERROR: cannot apply unary operator `~` to `bool`
        c = a + b; //~ ERROR: cannot apply builtin operator `+` to `bool` and `bool`
        c = a - b; //~ ERROR: cannot apply builtin operator `-` to `bool` and `bool`
        c = -a; //~ ERROR: cannot apply unary operator `-` to `bool`
        c = -b; //~ ERROR: cannot apply unary operator `-` to `bool`
        c = a * b; //~ ERROR: cannot apply builtin operator `*` to `bool` and `bool`
        c = a / b; //~ ERROR: cannot apply builtin operator `/` to `bool` and `bool`
        c = a ** b; //~ ERROR: cannot apply builtin operator `**` to `bool` and `bool`
        c = a % b; //~ ERROR: cannot apply builtin operator `%` to `bool` and `bool`
        c = a << b; //~ ERROR: cannot apply builtin operator `<<` to `bool` and `bool`
        c = a >> b; //~ ERROR: cannot apply builtin operator `>>` to `bool` and `bool`
    }
}
