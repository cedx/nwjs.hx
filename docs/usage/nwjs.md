# NW.js APIs
This library introduces the `js.nw` namespace, which is a wrapper around the `nw` global object
of the [browser context](https://docs.nwjs.io/en/latest/For%20Users/Advanced/JavaScript%20Contexts%20in%20NW.js/#browser-context).

```haxe
import js.Browser;
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

  // Read/write data from/to the clipboard.
  final clipboard = Clipboard.get();
  clipboard.set("I love NW.js :)", Text);
  trace(clipboard.get(Text));

  // Create a native context menu.
  final contextMenu = new Menu();
  contextMenu.append(new MenuItem({label: "Item A"}));

  Browser.document.body.addEventListener("contextmenu", event -> {
    event.preventDefault();
    contextMenu.popup(event.x, event.y);
  });
}
```

API documentation for the `nwjs` externs is available at the following address:  
[https://cedx.github.io/nwjs.hx/api](api/)

> For more information about the NW.js APIs, see [References](https://docs.nwjs.io/en/latest/References/App) in the [NW.js documentation](https://docs.nwjs.io).

When this library is imported by the [Haxe compiler](https://haxe.org/manual/compiler-usage.html),
the `nwjs` conditional compilation flag is automatically defined.
This flag is useful if you are developing in parallel a web application and a desktop one based on the same code:
it allows you to create different branches depending on the targeted platform.

```haxe
#if nwjs
import js.nw.Shell;
#else
import js.Browser;
#end

// Opens a given URL in the browser.
function main() {
  #if nwjs
    Shell.openExternal("https://github.com/cedx/nwjs.hx");
  #else
    Browser.window.open("https://github.com/cedx/nwjs.hx", "_blank");
  #end
}
```

> For more information about conditional compilation flags,
see [Conditional Compilation](https://haxe.org/manual/lf-condition-compilation.html) in the [Haxe manual](https://haxe.org/manual).
