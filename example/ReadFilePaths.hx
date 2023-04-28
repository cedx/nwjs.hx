import js.Browser;
import js.html.InputElement;

/** Reads the native path of files selected by the user. **/
function main() {
	final fileInput = (cast Browser.document.querySelector('input[type="file"]'): InputElement);
	final fileList = fileInput.files;
	for (index in 0...fileList.length) trace(untyped fileList[index].path);
}
