package js.nw;

import haxe.Constraints.Function;
import js.node.events.EventEmitter;

/** Represents a global keyboard shortcut, also known as system-wide hotkey. **/
@:native("nw.Shortcut")
extern class Shortcut extends EventEmitter<Shortcut> {

	/** The key combinations of the shortcut. **/
	final key: String;

	/** Creates a new shortcut. **/
	function new(options: ShortcutOptions);

	/** The callback invoked when the hotkey is triggered. **/
	dynamic function active(): Void;

	/** The callback invoked when failed to register the hotkey. **/
	dynamic function failed(): Void;
}

/** Defines the events of a `Shortcut` instance. **/
enum abstract ShortcutEvent<T: Function>(Event<T>) to Event<T> {

	/** The `active` event. **/
	var Active: ShortcutEvent<Void -> Void> = "active";

	/** The `failed` event. **/
	var Failed: ShortcutEvent<Void -> Void> = "failed";
}

/** Defines the options of a `Shortcut` instance. **/
typedef ShortcutOptions = {

	/** The key combinations of the shortcut. **/
	key: String,

	/** The callback to invoke when the hotkey is triggered. **/
	?active: () -> Void,

	/** The callback to invoke when failed to register the hotkey. **/
	?failed: () -> Void
}
