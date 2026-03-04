//@ compile-flags: -Ztypeck
function f() pure {
    ((, ())) = (1, 3); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
}

function g() pure {
    ((, ((, ())))) = (1, 3); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
//~^^ ERROR: tuple components cannot be empty
}

function t() pure returns (int, int) {
    return (4, 5);
}

function h() pure {
    ((, ())) = t(); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
}

function ff() pure {
    ((((, ())) , )) = ((1, 2), 3); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
//~^^ ERROR: tuple components cannot be empty
}

function fg() pure {
    (((, ())) , ) = ((1, 2), 3); //~ ERROR: tuple components cannot be empty
//~^ ERROR: tuple components cannot be empty
//~^^ ERROR: tuple components cannot be empty
}
