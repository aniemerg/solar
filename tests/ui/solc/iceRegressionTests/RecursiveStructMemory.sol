contract Test {
        struct RecursiveStruct {
                address payable d ;
                mapping ( uint => address payable ) c ;
                mapping ( uint => address payable [ ] ) d ; //~ ERROR: identifier `d` already declared
        }
        function func ( ) private pure {
                RecursiveStruct [ 1 ] memory val ;
                val ;
        }
}
