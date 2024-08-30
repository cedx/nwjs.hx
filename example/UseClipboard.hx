import haxe.crypto.Base64;
import js.nw.Clipboard;
import sys.FileSystem;
import sys.io.File;
using StringTools;

/** Reads and writes data to the clipboard. **/
function main() {
	final clipboard = Clipboard.get();
	clipboard.set("I love NW.js :)");
	trace(clipboard.get(Text));

	final imagePath = FileSystem.absolutePath("nw.png");
	final imageData = Base64.encode(File.getBytes(imagePath));
	final clipboardData: Array<ClipboardData> = [
		{type: Html, data: '<img src="file://${imagePath.urlEncode()}">'},
		{type: Png, data: imageData, raw: true}
	];

	clipboard.set(clipboardData);
	trace(clipboard.get(Html));
	clipboard.clear();
}
