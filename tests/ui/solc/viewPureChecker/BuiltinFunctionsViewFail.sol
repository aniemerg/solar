//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        payable(this).transfer(1);
    }
    function g() view public {
        require(payable(this).send(2)); //~ ERROR: no matching declarations found
    }
    function h() view public {
        selfdestruct(payable(this));
    }
    function i() view public {
        (bool success,) = address(this).delegatecall(""); //~ ERROR: mismatched types
//~^ ERROR: mismatched number of components
//~^^ ERROR: mismatched types
        require(success); //~ ERROR: no matching declarations found
    }
    function j() view public {
        (bool success,) = address(this).call(""); //~ ERROR: mismatched types
//~^ ERROR: mismatched number of components
//~^^ ERROR: mismatched types
        require(success); //~ ERROR: no matching declarations found
    }
    receive() payable external {
    }
}
