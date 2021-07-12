import haxe.crypto.Crc32;
import haxe.io.Path.*;
import haxe.zip.Entry;
import haxe.zip.Writer;
import sys.FileSystem.*;
import sys.io.File.*;

using Lambda;
using haxe.zip.Tools;

/** Recursively deletes all files in the specified `directory`. **/
function cleanDirectory(directory: String) for (entry in readDirectory(directory).filter(entry -> entry != ".gitkeep")) {
	final path = join([directory, entry]);
	if (isDirectory(path)) removeDirectory(path);
	else deleteFile(path);
}

/** Creates a ZIP archive from the specified file system entities. **/
function compress(sources: Array<String>, destination: String) {
	final output = write(destination);
	final writer = new Writer(output);

	var entries: Array<Entry> = [];
	for (source in sources) entries = entries.concat(isDirectory(source) ? compressDirectory(source) : [compressFile(source)]);
	writer.write(entries.list());
	output.close();
}

/** Recursively deletes the specified `directory`. **/
function removeDirectory(directory: String) {
	cleanDirectory(directory);
	deleteDirectory(directory);
}

/** Compresses the content of the specified `directory` in ZIP format. **/
private function compressDirectory(directory: String) {
	var entries: Array<Entry> = [];
	for (entry in readDirectory(directory)) {
		final path = join([directory, entry]);
		entries = entries.concat(isDirectory(path) ? compressDirectory(path) : [compressFile(path)]);
	}

	return entries;
}

/** Compresses the specified `file` in ZIP format. **/
private function compressFile(file: String) {
	final bytes = getBytes(file);
	final entry: Entry = {
		compressed: false,
		crc32: Crc32.make(bytes),
		data: bytes,
		dataSize: bytes.length,
		fileName: file,
		fileSize: bytes.length,
		fileTime: stat(file).mtime
	};

	entry.compress(9);
	return entry;
}
