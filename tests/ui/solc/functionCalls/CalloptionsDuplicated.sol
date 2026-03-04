//@ compile-flags: -Ztypeck
contract D {}
contract C {
    function foo(int a) payable external {
        this.foo{gas:2, gas: 5}; //~ ERROR: call options must be part of a call expression
        this.foo{value:2, value: 5}; //~ ERROR: call options must be part of a call expression
        this.foo{gas:2, value: 5, gas:2, value:3}; //~ ERROR: call options must be part of a call expression
        new D{salt:"abc", salt:"efg"}();
    }
}
