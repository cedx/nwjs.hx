//! --class-path src --library tink_core
import haxe.crypto.Crc32;
import haxe.zip.Entry;
import haxe.zip.Writer;
import nwjs.Platform;
import sys.FileSystem;
import sys.io.File;
using Lambda;
using haxe.io.Path;
using haxe.zip.Tools;

/** Publishes the package. **/
function main() {
	compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "src"], "var/haxelib.zip");
	Sys.command("haxelib submit var/haxelib.zip");
	for (action in ["tag", "push origin"]) Sys.command('git $action v${Platform.packageVersion}');
}

/** Creates a ZIP archive from the specified file system entities. **/
private function compress(sources: Array<String>, destination: String) {
	final output = File.write(destination);
	final writer = new Writer(output);

	var entries = [];
	for (source in sources) entries = entries.concat(FileSystem.isDirectory(source) ? compressDirectory(source) : [compressFile(source)]);
	writer.write(entries.list());
	output.close();
}

/** Compresses the content of the specified `directory` in ZIP format. **/
private function compressDirectory(directory: String) {
	var entries = [];
	for (entry in FileSystem.readDirectory(directory)) {
		final path = Path.join([directory, entry]);
		entries = entries.concat(FileSystem.isDirectory(path) ? compressDirectory(path) : [compressFile(path)]);
	}

	return entries;
}

/** Compresses the specified `file` in ZIP format. **/
private function compressFile(file: String) {
	final bytes = File.getBytes(file);
	final entry: Entry = {
		compressed: false,
		crc32: Crc32.make(bytes),
		data: bytes,
		dataSize: bytes.length,
		fileName: file,
		fileSize: bytes.length,
		fileTime: FileSystem.stat(file).mtime
	};

	entry.compress(9);
	return entry;
}
