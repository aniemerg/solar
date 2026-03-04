//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        address payable addr;
        uint balance = addr.balance;
        (bool callSuc,) = addr.call(""); //~ ERROR: mismatched types
//~^ ERROR: mismatched number of components
//~^^ ERROR: mismatched types
        (bool delegatecallSuc,) = addr.delegatecall(""); //~ ERROR: mismatched types
//~^ ERROR: mismatched number of components
//~^^ ERROR: mismatched types
        bool sendRet = addr.send(1);
        addr.transfer(1);
        balance; callSuc; delegatecallSuc; sendRet;
    }
}
