package js.nw;

import haxe.Constraints.Function;
import haxe.DynamicAccess;
import js.node.events.EventEmitter.Event;

/** Represents the application. **/
@:native("nw.App")
extern class App {

	/** The filtered command line arguments. **/
	static final argv: Array<String>;

	/** The application's data path in user's directory. **/
	static final dataPath: String;

	/** The unfiltered command line arguments. **/
	static final fullArgv: Array<String>;

	/** The patterns used to filter the command line arguments. **/
	static final filteredArgv: Array<String>;

	/** The JSON object of the manifest file. **/
	static final manifest: DynamicAccess<Dynamic>;

	/** The directory where the application starts. **/
	static final startPath: String;

	/** Adds a `listener` that will be invoked when the specified `event` is triggered. **/
	static function addListener<T: Function>(event: Event<T>, listener: T): App;

	/** Adds an entry to the whitelist used for controlling cross-origin access. **/
	static function addOriginAccessWhitelistEntry(
		sourceOrigin: String,
		destinationProtocol: String,
		destinationHost: String,
		allowDestinationSubdomains: Bool
	): Void;

	/** Marks the application cache group specified by `manifestUrl` obsolete. **/
	static function clearAppCache(manifestUrl: String): Void;

	/** Clears the HTTP cache in memory and the one on disk. **/
	static function clearCache(): Void;

	/** Sends the `close` event to all windows. **/
	static function closeAllWindows(): Void;

	/** Crashes the browser process. **/
	static function crashBrowser(): Void;

	/** Crashes the renderer process. **/
	static function crashRenderer(): Void;

	/** Queries the proxy to be used for loading `url` in DOM. **/
	static function getProxyForURL(url: String): Void;

	/** Removes the specified `listener` for the given `event`. **/
	static function off<T: Function>(event: Event<T>, listener: T): App;

	/** Adds a `listener` that will be invoked when the specified `event` is triggered. **/
	static function on<T: Function>(event: Event<T>, listener: T): App;

	/** Adds a one-time `listener` that will be removed and then invoked whenever the next time `event` is triggered. **/
	static function once<T: Function>(event: Event<T>, listener: T): App;

	/** Terminates the application. **/
	static function quit(): Void;

	/** Registers a global keyboard shortcut. **/
	static function registerGlobalHotKey(shortcut: Shortcut): Void;

	/** Removes the specified `listener` for the given `event`. **/
	static function removeListener<T: Function>(event: Event<T>, listener: T): App;

	/** Removes an entry from the whitelist used for controlling cross-origin access. **/
	static function removeOriginAccessWhitelistEntry(
		sourceOrigin: String,
		destinationProtocol: String,
		destinationHost: String,
		allowDestinationSubdomains: Bool
	): Void;

	/** Sets the proxy configuration which the web engine will use to request network resources. **/
	static function setProxyConfig(config: String, pacUrl: String): Void;

	/** Unregisters a global keyboard shortcut. **/
	static function unregisterGlobalHotKey(shortcut: Shortcut): Void;
}

/** Defines the events of an `App` instance. **/
enum abstract AppEvent<T: Function>(Event<T>) to Event<T> {

	/** The `open` event. **/
	var Open: AppEvent<String -> Void> = "open";

	/** The `reopen` event. **/
	var Reopen: AppEvent<Void -> Void> = "reopen";
}
