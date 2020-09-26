package js.nw;

import haxe.DynamicAccess;

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

	/** Sets up an `handler` that will be invoked when the specified `event` is delivered to the application. **/
	@:overload(function(event: AppEvent, handler: String -> Void): Void {})
	static function on(event: AppEvent, handler: () -> Void): Void;

	/** Terminates the application. **/
	static function quit(): Void;

	/** Registers a global keyboard shortcut. **/
	static function registerGlobalHotKey(shortcut: Shortcut): Void;

	/** Removes an entry from the whitelist used for controlling cross-origin access. **/
	static function removeOriginAccessWhitelistEntry(
		sourceOrigin: String,
		destinationProtocol: String,
		destinationHost: String,
		allowDestinationSubdomains: Bool
	): Void;

	/** Sets the proxy configuration which the Web engine will use to request network resources. **/
	static function setProxyConfig(config: String, pacUrl: String): Void;

	/** Unregisters a global keyboard shortcut. **/
	static function unregisterGlobalHotKey(shortcut: Shortcut): Void;
}

/** Defines the events of an `App` instance. **/
enum abstract AppEvent(String) {

	/** The `open` event. **/
	var Open = "open";

	/** The `reopen` event. **/
	var Reopen = "reopen";
}
