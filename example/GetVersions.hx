import js.Node;
import js.Nw;

/** Lists the version strings of NW.js. **/
function main() {
	trace(Nw.flavor); // The NW.js flavor.
	trace(Nw.version); // The NW.js version.
	trace(Node.process.versions["chromium"]); // The Chromium version.
	trace(Node.process.versions["node"]); // The Node.js version.
}
