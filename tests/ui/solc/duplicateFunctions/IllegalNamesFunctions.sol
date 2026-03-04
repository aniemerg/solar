contract C {
    function _() internal returns(uint) {
        return 1;
    }

    function super() internal { //~ ERROR: identifier `super` already declared
    }

    function this() internal { //~ ERROR: identifier `this` already declared
    }
}
