contract C
{
    function f() public
    {
        int x = +(0, 0); //~ ERROR: unary plus is not supported
    }
}
