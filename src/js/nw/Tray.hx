package js.nw;

import haxe.Constraints.Function;
import js.node.events.EventEmitter;

/** An abstraction of different controls on different platforms, usually it's a small icon shown on the OS's notification area. **/
@:native("nw.Tray")
extern class Tray extends EventEmitter<Tray> {

	/** The alternate icon. **/
	var alticon: String;

	/** The tray icon. **/
	var icon: String;

	/** Value indicating whether icons are treated as templates. **/
	var iconsAreTemplates: Bool;

	/** The popup menu. **/
	var menu: Menu;

	/** The tray title. **/
	var title: String;

	/** The tray tooltip. **/
	var tooltip: String;

	/** Creates a new tray. **/
	function new(options: TrayOptions);

	/** Removes the tray. **/
	function remove(): Void;
}

/** Defines the events of a `Tray` instance. **/
enum abstract TrayEvent<T: Function>(Event<T>) to Event<T> {

	/** The `click` event. **/
	var Click: TrayEvent<Void -> Void> = "click";
}

/** Defines the options of a `Tray` instance. **/
typedef TrayOptions = {

	/** The alternate icon. **/
	var ?alticon: String;

	/** The tray icon. **/
	var ?icon: String;

	/** Value indicating whether icons are treated as templates. **/
	var ?iconsAreTemplates: Bool;

	/** The popup menu. **/
	var ?menu: Menu;

	/** The tray title. **/
	var ?title: String;

	/** The tray tooltip. **/
	var ?tooltip: String;
}
