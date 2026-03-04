//@ compile-flags: -Ztypeck
contract D {}
contract C {
    function foo(int a) payable external {
        this.foo{value:2, gas: 5}{gas:2}; //~ ERROR: call options must be part of a call expression
//~^ ERROR: call options must be part of a call expression
        (this.foo{value:2, gas: 5}){gas:2}; //~ ERROR: call options must be part of a call expression
//~^ ERROR: call options must be part of a call expression
        this.foo{value:2, gas: 5}{value:6}; //~ ERROR: call options must be part of a call expression
//~^ ERROR: call options must be part of a call expression
        this.foo{gas:2, value: 5}{value:2, gas:5}; //~ ERROR: call options must be part of a call expression
//~^ ERROR: call options must be part of a call expression
        new D{salt:"abc"}{salt:"a"}(); //~ ERROR: call options must be part of a call expression
    }
}
