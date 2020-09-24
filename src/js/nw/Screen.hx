package js.nw;

/** TODO **/
@:native("nw.Screen.DesktopCaptureMonitor")
extern class DesktopCaptureMonitor {
	// TODO
}

/** TODO **/
enum abstract DesktopMediaSource(String) from String to String {

	/** TODO **/
	var Screen = "screen";

	/** TODO **/
	var Window = "window";
}

/** A collection of APIs to query the screens connected to the computer. **/
@:native("nw.Screen")
extern class Screen {

	/** The list of screens connected to the computer. **/
	final screens: Array<ScreenDefinition>;

	/** Initializes the `Screen` singleton object. **/
	static function Init(): Void;

	/** Sets up an `handler` that will be invoked whenever the specified `event` is delivered to this object. **/
	static function on(event: ScreenEvent, handler: ScreenDefinition -> Void): Void;
}

/** Defines the structure of a screen. **/
typedef ScreenDefinition = {

	/** The physical screen resolution. **/
	var bounds: {x: Int, y: Int, width: Int, height: Int};

	/** The screen identifier. **/
	var id: Int;

	/** Value indicating whether the screen is built-in. **/
	var isBuiltIn: Bool;

	/** TODO **/
	var rotation: Int;

	/** The scale factor. **/
	var scaleFactor: Float;

	/** TODO **/
	var touchSupport: Int;

	/** The usable area within the screen bounds. **/
	var work_area: {x: Int, y: Int, width: Int, height: Int};
}

/** Defines the events of a `Screen` instance. **/
enum abstract ScreenEvent(String) from String to String {

	/** The `displayAdded` event. **/
	var DisplayAdded = "displayAdded";

	/** The `displayBoundsChanged` event. **/
	var DisplayBoundsChanged = "displayBoundsChanged";

	/** The `displayRemoved` event. **/
	var DisplayRemoved = "displayRemoved";
}
