package js.nw;

/** Represents a global keyboard shortcut, also known as system-wide hotkey. **/
@:native("nw.Shortcut")
extern class Shortcut {

	/** The key combinations of the shortcut. **/
	final key: String;

	/** Creates a new shortcut. **/
	function new(options: ShortcutOptions);

	/** The callback invoked when the hotkey is triggered. **/
	dynamic function active(): Void;

	/** The callback invoked when failed to register the hotkey. **/
	dynamic function failed(): Void;

	/** Sets up an `handler` that will be invoked whenever the specified `event` is delivered to this object. **/
	function on(event: ShortcutEvent, handler: () -> Void): Void;
}

/** Defines the events of a `Shortcut` instance. **/
enum abstract ShortcutEvent(String) from String to String {

	/** The `active` event. **/
	var Active = "active";

	/** The `failed` event. **/
	var Failed = "failed";
}

/** Defines the options of a `Shortcut` instance. **/
typedef ShortcutOptions = {

	/** The callback to invoke when the hotkey is triggered. **/
	var ?active: () -> Void;

	/** The callback to invoke when failed to register the hotkey. **/
	var ?failed: () -> Void;

	/** The key combinations of the shortcut. **/
	var key: String;
}
