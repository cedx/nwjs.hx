import js.node.Fs;
import js.node.Path;
import js.nw.Clipboard;

using StringTools;

/** Reads and writes data to the clipboard. **/
function main() {
	final clipboard = Clipboard.get();
	clipboard.set("I love NW.js :)", Text);
	trace(clipboard.get(Text));

	final imagePath = Path.resolve("nw.png");
	final imageData = Fs.readFileSync(imagePath).toString("base64");
	final clipboardData: Array<ClipboardData> = [
		{type: Html, data: '<img src="file://${imagePath.urlEncode()}"/>'},
		{type: Png, data: imageData, raw: true}
	];

	clipboard.set(clipboardData);
	trace(clipboard.get(Html));
	clipboard.clear();
}
