contract C {
	event A();
	function f() {
		emit A; //~ ERROR: expected `(`, found `;`
	}
}
