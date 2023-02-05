import js.Browser;
import js.html.InputElement;
import js.node.Fs;

/** Reads a file selected by the user with Node.js API. **/
function main() {
	final fileInput = cast(Browser.document.querySelector('input[type="file"]'), InputElement);
	final filePath = fileInput.value;
	Fs.readFile(filePath, "utf8", (error, text) -> {
		if (error != null) Browser.console.error(error);
		else trace(text);
	});
}
