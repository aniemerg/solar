contract C
{
    function f(int x) public
    {
        (x /= 1) + +(1,1); //~ ERROR: unary plus is not supported
    }
}
