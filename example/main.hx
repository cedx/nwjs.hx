import js.Browser.*;
import js.Lib.nativeThis;
import js.Node.process;
import js.html.InputElement;
import js.node.Fs;
import js.node.Path;
import js.Nw;
import js.nw.App;
import js.nw.Clipboard;
import js.nw.Menu;
import js.nw.MenuItem;
import js.nw.Shell;
import js.nw.Shortcut;
import js.nw.Tray;
import js.nw.Window;

using StringTools;

/** A sample class. **/
class Example {

	/** Creates a native context menu. **/
	public function createContextMenu() {
		final contextMenu = new Menu();
		contextMenu.append(new MenuItem({label: "Item A"}));
		contextMenu.append(MenuItem.newSeparator());
		contextMenu.append(new MenuItem({
			type: Checkbox,
			label: "Item B",
			icon: "img/icon.png",
			key: "s",
			modifiers: "ctrl+alt",
			click: () -> alert("You have activated 'Item B'")
		}));

		document.body.addEventListener("contextmenu", event -> {
			event.preventDefault();
			contextMenu.popup(event.x, event.y);
		});
	}

	/** Creates and sets the menubar. **/
	public function createMenubar() {
		final submenu = new Menu();
		submenu.append(new MenuItem({label: "Item A"}));
		submenu.append(new MenuItem({label: "Item B"}));

		final menubar = Menu.newMenubar();
		if (process.platform == "darwin") menubar.createMacBuiltin("My App");
		menubar.append(new MenuItem({
			label: "First Menu",
			submenu: submenu
		}));

		Window.get().menu = menubar;
	}

	/** Adds a system tray icon to the notification area. **/
	public function createTray() {
		final menu = new Menu();
		menu.append(new MenuItem({type: Checkbox, label: "Box 1"}));

		var tray = new Tray({
			title: "Tray",
			icon: "img/icon.png",
			menu: menu
		});

		tray.on(TrayEvent.Click, () -> {
			tray.remove();
			tray = null;
		});
	}

	/** Lists the version strings of NW.js. **/
	public function getVersions() {
		console.log(Nw.flavor); // The NW.js flavor.
		console.log(Nw.version); // The NW.js version.
		console.log(process.versions["chromium"]); // The Chromium version.
		console.log(process.versions["node"]); // The Node.js version.
	}

	/** Opens a new window. **/
	public function openWindow() {
		Window.open("https://nwjs.io", newWindow -> {
			newWindow.on(Closed, () -> newWindow = null);
			newWindow.on(Focus, () -> console.log('New window is focused'));
		});
	}

	/** Reads a file selected by the user with Node.js API. **/
	public function readFileFromNode() {
		final fileInput = cast(document.querySelector('input[type="file"]'), InputElement);
		final filePath = fileInput.value;
		Fs.readFile(filePath, "utf8", (error, text) -> {
			if (error != null) console.error(error);
			else console.log(text);
		});
	}

	/** Reads the native path of files selected by the user. **/
	public function readFilePaths() {
		final fileInput = cast(document.querySelector('input[type="file"]'), InputElement);
		final fileList = fileInput.files;
		for (index in 0...fileList.length) console.log(untyped fileList[index].path);
	}

	/** Registers a global keyboard shortcut. **/
	public function registerShortcut() {
		final shortcut = new Shortcut({key : "Ctrl+Shift+A"});
		shortcut.on(Active, () -> {
			final self: Shortcut = nativeThis;
			console.log('Global desktop keyboard shortcut: ${self.key} active.');
		});

		App.registerGlobalHotKey(shortcut);
	}

	/** Reads and writes data to the clipboard. **/
	public function useClipboard() {
		final clipboard = Clipboard.get();
		clipboard.set("I love NW.js :)", Text);
		console.log(clipboard.get(Text));

		final imagePath = Path.resolve("nw.png");
		final imageData = Fs.readFileSync(imagePath).toString("base64");
		final clipboardData: Array<ClipboardData> = [
			{type: Html, data: '<img src="file://${imagePath.urlEncode()}">'},
			{type: Png, data: imageData, raw: true}
		];

		clipboard.set(clipboardData);
		console.log(clipboard.get(Html));
		clipboard.clear();
	}

	/** Uses the shell to perform desktop related jobs. **/
	public function useShell() {
		Shell.openExternal("https://nwjs.io"); // Open a URL with the default browser.
		Shell.openItem("test.txt"); // Open a text file with the default text editor.
		Shell.showItemInFolder("test.txt"); // Show a file in its parent folder with the file manager.
	}
}
