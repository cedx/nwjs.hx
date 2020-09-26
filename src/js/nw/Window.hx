package js.nw;

import haxe.Constraints.Function;
import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.html.IFrameElement;
import js.html.Window as DomWindow;
import js.node.events.EventEmitter;

/** A wrapper of the DOM's topmost `window` object. **/
@:native("nw.Window")
extern class Window extends EventEmitter<Window> {

	/** The cookies manager. **/
	final cookies: Cookies;

	/** The window's height. **/
	var height: Int;

	/** Value indicating whether this window is always on top of other windows. **/
	final isAlwaysOnTop: Bool;

	/** Value indicating whether the fullscreen mode is enabled. **/
	final isFullscreen: Bool;

	/** Value indicating whether the kiosk mode is enabled. **/
	final isKioskMode: Bool;

	/** Value indicating whether the transparency is enabled. **/
	final isTransparent: Bool;

	/** The window's menubar. **/
	var menu: Menu;

	/** The window's title. **/
	var title: String;

	/** The window's width. **/
	var width: Int;

	/** The underlying DOM window object. **/
	final window: DomWindow;

	/** The left offset from window frame to screen. **/
	var x: Int;

	/** The top offset from window frame to screen. **/
	var y: Int;

	/** The page zoom. **/
	var zoomLevel: Float;

	/** Returns the window object **/
	static function get(?windowObject: DomWindow): Window;

	/** Returns all windows. **/
	static function getAll(callback: Array<Window> -> Void): Void;

	/** Open a new window and loads the specified URL in it. **/
	@:overload(function(url: String, options: WindowOpenOptions, ?callback: Window -> Void): Void {})
	static function open(url: String, ?callback: Window -> Void): Void;

	/** Moves the focus away. **/
	function blur(): Void;

	/** Closes this window. **/
	function close(?force: Bool): Void;

	/** Close the development tools window. **/
	function closeDevTools(): Void;

	/** Enters the fullscreen mode. **/
	function enterFullscreen(): Void;

	/** Enters the kiosk mode. **/
	function enterKioskMode(): Void;

	/** Puts the focus on this window. **/
	function focus(): Void;

	/** TODO Enumerates the printers in the system. **/
	function getPrinters(callback: Array<DynamicAccess<Dynamic>>): Void;

	/** Hides this window. **/
	function hide(): Void;

	/** Returns a value indicating whether the development tools window is open. **/
	function isDevToolsOpen(): Bool;

	/** Leaves the fullscreen mode. **/
	function leaveFullscreen(): Void;

	/** Leaves the kiosk mode. **/
	function leaveKioskMode(): Void;

	/** Maximizes this window. **/
	function maximize(): Void;

	/** Minimizes this window. **/
	function minimize(): Void;

	/** Moves this window a specified number of pixels relative to its current coordinates. **/
	function moveBy(x: Int, y: Int): Void;

	/** Moves this window's left and top edge to the specified coordinates. **/
	function moveTo(x: Int, y: Int): Void;

	/** Reloads this window. **/
	function reload(): Void;

	/** Reloads this window by starting a new renderer process from scratch. **/
	function reloadDev(): Void;

	/** Reloads this window by ignoring caches. **/
	function reloadIgnoringCache(): Void;

	/** Resizes this window by the specified `width` and `height` **/
	function resizeBy(width: Int, height: Int): Void;

	/** Resizes this window to the specified `width` and `height`. **/
	function resizeTo(width: Int, height: Int): Void;

	/** Restores this window to its previous state. **/
	function restore(): Void;

	/** Sets the inner height of this window. **/
	function setInnerHeight(height: Int): Void;

	/** Sets the inner width of this window. **/
	function setInnerWidth(width: Int): Void;

	/** Enables or disables the window's native shadow. **/
	function setShadow(hasShadow: Bool): Void;

	/** Shows this window. **/
	function show(?isShown: Bool): Void;

	/** Opens the development tools to inspect this window. **/
	@:overload(function(callback: Window -> Void): Void {})
	function showDevTools(?iframe: EitherType<IFrameElement, String>, ?callback: Window -> Void): Void;

	/** Toggles the fullscreen mode. **/
	function toggleFullscreen(): Void;

	/** Toggles the kiosk mode. **/
	function toggleKioskMode(): Void;
}

/** Defines the events of a `Window` instance. **/
enum abstract WindowEvent<T: Function>(Event<T>) to Event<T> {

	/** The `blur` event. **/
	var Blur: WindowEvent<Void -> Void> = "blur";

	/** The `close` event. **/
	var Close: WindowEvent<Void -> Void> = "close";

	/** The `closed` event. **/
	var Closed: WindowEvent<Void -> Void> = "closed";

	/** The `devtools-closed` event. **/
	var DevToolsClosed: WindowEvent<Void -> Void> = "devtools-closed";

	/** The `document-end` event. **/
	var DocumentEnd: WindowEvent<Null<IFrameElement> -> Void> = "document-end";

	/** The `document-start` event. **/
	var DocumentStart: WindowEvent<Null<IFrameElement> -> Void> = "document-start";

	/** The `enter-fullscreen` event. **/
	var EnterFullscreen: WindowEvent<Void -> Void> = "enter-fullscreen";

	/** The `focus` event. **/
	var Focus: WindowEvent<Void -> Void> = "focus";

	/** The `loaded` event. **/
	var Loaded: WindowEvent<Void -> Void> = "loaded";

	/** The `loading` event. **/
	var Loading: WindowEvent<Void -> Void> = "loading";

	/** The `maximize` event. **/
	var Maximize: WindowEvent<Void -> Void> = "maximize";

	/** The `minimize` event. **/
	var Minimize: WindowEvent<Void -> Void> = "minimize";

	/** The `move` event. **/
	var Move: WindowEvent<(Int, Int) -> Void> = "move";

	/** The `navigation` event. **/
	var Navigation: WindowEvent<(Null<IFrameElement>, String, WindowPolicy) -> Void> = "navigation";

	/** The `new-win-policy` event. **/
	var NewWinPolicy: WindowEvent<(Null<IFrameElement>, String, WindowPolicy) -> Void> = "new-win-policy";

	/** The `resize` event. **/
	var Resize: WindowEvent<(Int, Int) -> Void> = "resize";

	/** The `restore` event. **/
	var Restore: WindowEvent<Void -> Void> = "restore";

	/** The `zoom` event. **/
	var Zoom: WindowEvent<Int -> Void> = "zoom"; // TODO ? Float -> Void
}

/** Defines the manifest of a `Window` instance. **/
typedef WindowManifest = {

	/** Value indicating whether the window should always stay on top of other windows. **/
	var ?always_on_top: Bool;

	/** Value indicating whether to show the window as desktop background window under X11 environment. **/
	var ?as_desktop: Bool;

	/** Value indicating whether the window is frameless. **/
	var ?frame: Bool;

	/** Value indicating whether the window is fullscreen. **/
	var ?fullscreen: Bool;

	/** The initial inner height of the main window. **/
	var ?height: Int;

	/** The path to the window's icon. **/
	var ?icon: String;

	/** The window identifier. **/
	var ?id: String;

	/** Value indicating whether to use the kiosk mode. **/
	var ?kiosk: Bool;

	/** The maximum inner height of the window. **/
	var ?max_height: Bool;

	/** The maximum inner width of the window. **/
	var ?max_width: Bool;

	/** The minimum inner height of the window. **/
	var ?min_height: Bool;

	/** The minimum inner width of the window. **/
	var ?min_width: Bool;

	/** Value indicating where the window will be positioned. **/
	var ?position: WindowPosition;

	/** Value indicating whether the window is resizable. **/
	var ?resizable: Bool;

	/** Value indicating whether to show the window on startup. **/
	var ?show: Bool;

	/** Value indicating whether the window is shown in the taskbar or dock. **/
	var ?show_in_taskbar: Bool;

	/** The default title of windows. **/
	var ?title: String;

	/** Value indicating whether to turn on transparency. **/
	var ?transparent: Bool;

	/** Value indicating whether the window should be visible on all workspaces simultaneously. **/
	var ?visible_on_all_workspaces: Bool;

	/** The initial inner width of the main window. **/
	var ?width: Int;
}

/** Defines the options of the `Window.open()` method. **/
typedef WindowOpenOptions = WindowManifest & {

	/** The script to be injected after the DOM is loaded, before the `onload` event is fired. **/
	var ?inject_js_end: String;

	/** The script to be injected before any DOM is constructed and any script is run. **/
	var ?inject_js_start: String;

	/** Value indicating whether to open the new window in a separate render process. **/
	var ?new_instance: Bool;
}

/** Defines the policy of a `Window` instance. **/
typedef WindowPolicy = {

	/** Forces the link to be opened in the same frame. **/
	var ?forceCurrent: () -> Void;

	/** Forces the link to be downloaded or opened by an external program. **/
	var ?forceDownload: () -> Void;

	/** Forces the link to be opened in a new popup window. **/
	var ?forceNewPopup: () -> Void;

	/** Forces the link to be opened in a new window. **/
	var ?forceNewWindow: () -> Void;

	/** Ignores the request. **/
	var ignore: () -> Void;

	/** Controls the options for the new popup window. **/
	var ?setNewWindowManifest: WindowManifest -> Void;
}

/** Defines the position of a `Window` instance. **/
enum abstract WindowPosition(String) {

	/** The window is... TODO **/
	var Center = "center";

	/** The window is... TODO **/
	var Mouse = "mouse";

	/** The window is... TODO **/
	var Null = "null";
}

/** Defines the options of the `Window.print()` method. **/
typedef WindowPrintOptions = {
	// TODO
}
