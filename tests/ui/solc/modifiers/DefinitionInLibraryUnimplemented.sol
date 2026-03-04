library L {
    modifier mu; //~ ERROR: library functions must be implemented if declared
    modifier muv virtual; //~ ERROR: library functions must be implemented if declared
}
