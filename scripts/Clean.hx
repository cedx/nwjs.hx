import sys.FileSystem;
using Lambda;

/** Deletes all generated files. **/
function main() {
	["lib", "res"].filter(FileSystem.exists).iter(Tools.removeDirectory);
	Tools.cleanDirectory("var");
}
