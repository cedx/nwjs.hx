package js.nw;

import haxe.Constraints.Function;
import js.node.events.EventEmitter.Event;

/** TODO **/
@:native("nw.Screen.DesktopCaptureMonitor")
extern class DesktopCaptureMonitor {
	// TODO

	/** Adds a `listener` that will be invoked whenever the specified `event` is delivered to this object. **/
	// @:overload(function(event: DesktopCaptureMonitorEvent, handler: Null<IFrameElement> -> Void): Void {})
	// function on(event: DesktopCaptureMonitorEvent, handler: ScreenDefinition -> Void): Void;
}

enum abstract DesktopCaptureMonitorEvent<T: Function>(Event<T>) to Event<T> {

}

/** TODO **/
enum abstract DesktopMediaSource(String) {

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

	/** Adds a `listener` that will be invoked whenever the specified `event` is triggered. **/
	static function addListener<T: Function>(event: Event<T>, listener: T): App;

	/** Removes the specified `listener` for the given `event`. **/
	static function off<T: Function>(event: Event<T>, listener: T): App;

	/** Adds a `listener` that will be invoked whenever the specified `event` is triggered. **/
	static function on<T: Function>(event: Event<T>, listener: T): App;

	/** Adds a one-time `listener` that will be removed and then invoked whenever the next time `event` is triggered. **/
	static function once<T: Function>(event: Event<T>, listener: T): App;

	/** Removes the specified `listener` for the given `event`. **/
	static function removeListener<T: Function>(event: Event<T>, listener: T): App;
}

/** Defines the structure of a screen. **/
typedef ScreenDefinition = {

	/** The physical screen resolution. **/
	var bounds: {x: Int, y: Int, width: Int, height: Int};

	/** The screen identifier. **/
	var id: Int;

	/** Value indicating whether the screen is built-in. **/
	var isBuiltIn: Bool;

	/** The angle of rotation applied to the screen. **/
	var rotation: Int;

	/** The scale factor. **/
	var scaleFactor: Float;

	/** The number of touch points supported by the screen. **/
	var touchSupport: Int;

	/** The usable area within the screen bounds. **/
	var work_area: {x: Int, y: Int, width: Int, height: Int};
}

/** Defines the events of a `Screen` instance. **/
enum abstract ScreenEvent<T: Function>(Event<T>) to Event<T> {

	/** The `displayAdded` event. **/
	var DisplayAdded: ScreenEvent<ScreenDefinition -> Void> = "displayAdded";

	/** The `displayBoundsChanged` event. **/
	var DisplayBoundsChanged: ScreenEvent<ScreenDefinition -> Void> = "displayBoundsChanged";

	/** The `displayRemoved` event. **/
	var DisplayRemoved: ScreenEvent<ScreenDefinition -> Void> = "displayRemoved";
}
