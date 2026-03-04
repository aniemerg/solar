//@ compile-flags: -Ztypeck
contract C {
    function f0() public { (()) = 2; } //~ ERROR: tuple components cannot be empty
//~^ ERROR: empty tuple on the left hand side

    function f1() public pure { (()) = (); } //~ ERROR: tuple components cannot be empty
//~^ ERROR: empty tuple on the left hand side

    //#8711
    function f2() internal pure returns (uint, uint) { return () = f2(); } //~ ERROR: empty tuple on the left hand side
//~^ ERROR: mismatched types

    //#8277
    function f3()public{return()=();} //~ ERROR: empty tuple on the left hand side

    //#8277
    function f4 ( bytes32 hash , uint8 v , bytes32 r , bytes32 s , uint blockExpired , bytes32 salt ) public returns ( address ) {
        require ( ( ( ) ) |= keccak256 ( abi . encodePacked ( blockExpired , salt ) ) ) ; //~ ERROR: no matching declarations found
        return ecrecover ( hash , v , r , s ) ;
    }
}
