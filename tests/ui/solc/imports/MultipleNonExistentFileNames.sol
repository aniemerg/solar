//@ compile-flags: -Ztypeck
import "~~~some-long-unlikely-file-name-12"; //~ ERROR: file ~~~some-long-unlikely-file-name-12 not found
import "~~~some-long-unlikely-file-name-456"; //~ ERROR: file ~~~some-long-unlikely-file-name-456 not found
import "~~~some-long-unlikely-file-name-7890"; //~ ERROR: file ~~~some-long-unlikely-file-name-7890 not found
// This test is here to verify that the license/pragma preamble added by the test suite does not
// affect source locations in error messages. Positions in messages below should start at 0 and
// there should be no gaps between the ranges.
