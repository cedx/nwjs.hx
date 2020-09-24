package js.nw;

/** An abstraction of different controls on different platforms, usually it's a small icon shown on the OS's notification area. **/
@:native("nw.Tray")
extern class Tray {

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

	/** Sets up an `handler` that will be invoked whenever the specified `event` is delivered to this object. **/
	function on(event: TrayEvent, handler: () -> Void): Void;
}

/** Defines the events of a `Tray` instance. **/
enum abstract TrayEvent(String) from String to String {

	/** The `click` event. **/
	var Click = "click";
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
