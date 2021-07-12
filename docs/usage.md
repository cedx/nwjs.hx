# Usage
**Haxe externs for NW.js** provides type definitions for developing desktop applications with the [NW.js](https://nwjs.io) framework.

If you haven't used [NW.js](https://nwjs.io) before, be sure to check out the [related documentation](https://docs.nwjs.io), as it explains how to create such applications.
It is important that you understand the concept of [JavaScript contexts](https://docs.nwjs.io/en/latest/For%20Users/Advanced/JavaScript%20Contexts%20in%20NW.js) because the **NW.js externs are not usable in Node.js context**.

?> For more information about type definitions, see [Externs](https://haxe.org/manual/lf-externs.html) in the [Haxe manual](https://haxe.org/manual). 

## Using the NW.js APIs
This library introduces the `js.nw` namespace, which is a wrapper around the `nw` global object
of the [browser context](https://docs.nwjs.io/en/latest/For%20Users/Advanced/JavaScript%20Contexts%20in%20NW.js/#browser-context).

```haxe
import js.Browser.document;
import js.Nw;
import js.nw.Clipboard;
import js.nw.Menu;
import js.nw.MenuItem;
import js.nw.Window;

function main() {
	// List the version strings of NW.js.
	trace(Nw.flavor);
	trace(Nw.version);

	// Open a new window.
	Window.open("https://nwjs.io", newWindow -> {
		newWindow.on(Focus, () -> trace('New window is focused'));
	});

	// Read/write data to the clipboard.
	final clipboard = Clipboard.get();
	clipboard.set("I love NW.js :)", Text);
	trace(clipboard.get(Text));

	// Create a native context menu.
	final contextMenu = new Menu();
	contextMenu.append(new MenuItem({label: "Item A"}));

	document.body.addEventListener("contextmenu", event -> {
		event.preventDefault();
		contextMenu.popup(event.x, event.y);
	});
}
```

API documentation for the `nwjs` externs is available at the following address:  
[https://cedx.github.io/nwjs.hx/api](https://cedx.github.io/nwjs.hx/api)

?> For more information about the NW.js APIs, see [References](https://docs.nwjs.io/en/latest/References/App) in the [NW.js documentation](https://docs.nwjs.io).

When this library is imported by the [Haxe compiler](https://haxe.org/manual/compiler-usage.html),
the `nwjs` conditional compilation flag is automatically defined.
This flag is useful if you are developing in parallel a web application and a desktop one based on the same code:
it allows you to create different branches depending on the targeted platform.

```haxe
#if nwjs
import js.nw.Shell;
#else
import js.Browser.window;
#end

// Opens a given URL in the browser.
function main() {
	#if nwjs
		Shell.openExternal("https://cedx.github.io/nwjs.hx");
	#else
		window.open("https://cedx.github.io/nwjs.hx", "_blank");
	#end
}
```

?> For more information about conditional compilation flags,
see [Conditional Compilation](https://haxe.org/manual/lf-condition-compilation.html) in the [Haxe manual](https://haxe.org/manual).

## Using the Node.js APIs
Access to the Node.js APIs is provided by the externs of the `hxnodejs` package, which is a dependency of this library.
Most Node.js APIs are located in the `js.node` namespace and are consumed as is:

```haxe
import js.Node.process;
import js.Node.require;
import js.node.ChildProcess;
import js.node.Fs;

function main() {
	// Log the operating system platform and processor architecture to the console.
	trace('This platform is ${process.platform} on ${process.arch}.');

	// Read/write some text to the file system.
	Fs.writeFileSync("message.txt", "Hello from NW.js!");
	trace(Fs.readFileSync("message.txt", "utf8"));

	// Spawn a new process.
	ChildProcess.spawn("ls", ["-lh", "/usr"]);

	// Import an external JavaScript module.
	final module = require("./path/to/module.js");
}
```

API documentation for the `hxnodejs` externs is available at the following address:  
[https://haxefoundation.github.io/hxnodejs](https://haxefoundation.github.io/hxnodejs)

?> For changes made by NW.js to the Node.js APIs,
see [Changes to Node](https://docs.nwjs.io/en/latest/References/Changes%20to%20Node) in the [NW.js documentation](https://docs.nwjs.io).

## Using the DOM APIs
Nothing special is required to access the DOM APIs, just write your application in the usual way.

```haxe
import js.Browser.alert;
import js.Browser.navigator;

function main() {
	// Log the user agent string to the console.
	trace(navigator.userAgent);

	// Display an alert message box.
	alert("Hello from NW.js!");
}
```

?> For changes made by NW.js to the DOM APIs,
see [Changes to DOM](https://docs.nwjs.io/en/latest/References/Changes%20to%20DOM) in the [NW.js documentation](https://docs.nwjs.io).

## Using the Chrome APIs
[NW.js](https://nwjs.io) supports all APIs in the [Chrome Apps](https://developer.chrome.com/apps/api_index) platform
and some APIs in the [Chrome Extensions](https://developer.chrome.com/extensions/api_index) platform.

**This library does not provide any extern for these APIs.** If you need to consume Chrome APIs from your application,
you will need to install one of the following [Haxelib](https://lib.haxe.org) packages:

- [chrome-app](https://lib.haxe.org/p/chrome-app) : provides externs for the Chrome Apps APIs.
- [chrome-extension](https://lib.haxe.org/p/chrome-extension) : provides externs for the Chrome Extensions APIs.

!> Chrome will be removing support for **Chrome Apps** on all platforms. **Chrome Extensions** will continue to be supported.
[Read the announcement](https://blog.chromium.org/2020/01/moving-forward-from-chrome-apps.html)
and learn more about [migrating your application](https://developers.chrome.com/apps/migration).
