import sys.FileSystem;
using Lambda;
using haxe.io.Path;

/** Deletes all generated files. **/
function main() {
	["lib", "res"].filter(FileSystem.exists).iter(removeDirectory);
	cleanDirectory("var");
}

/** Recursively deletes all files in the specified `directory`. **/
private function cleanDirectory(directory: String) for (entry in FileSystem.readDirectory(directory).filter(entry -> entry != ".gitkeep")) {
	final path = Path.join([directory, entry]);
	FileSystem.isDirectory(path) ? removeDirectory(path) : FileSystem.deleteFile(path);
}

/** Recursively deletes the specified `directory`. **/
private function removeDirectory(directory: String) {
	cleanDirectory(directory);
	FileSystem.deleteDirectory(directory);
}
