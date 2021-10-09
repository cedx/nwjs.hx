import js.nw.Shell;

/** Uses the shell to perform desktop related jobs. **/
function main() {
	Shell.openExternal("https://nwjs.io"); // Open a URL with the default browser.
	Shell.openItem("test.txt"); // Open a text file with the default text editor.
	Shell.showItemInFolder("test.txt"); // Show a file in its parent folder with the file manager.
}
