package js.nw;

import js.node.events.EventEmitter;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.node.events.EventEmitter.Event;

/** Monitors the changes of screens and windows on the desktop. **/
extern class DesktopCaptureMonitor extends EventEmitter<DesktopCaptureMonitor> {

	/** Value indicating whether the dektop capture monitor is started. **/
	final started: Bool;

	/** Registers and returns a valid stream identifier. **/
	function registerStream(id: String): Void;

	/** Starts monitoring the system and triggering the events. **/
	function start(shouldIncludeScreens: Bool, shouldIncludeWindows: Bool): Void;

	/** Stops monitoring the system. **/
	function stop(): Void;
}

/** Defines the events of a `DesktopCaptureMonitor` instance. **/
enum abstract DesktopCaptureMonitorEvent<T: Function>(Event<T>) to Event<T> {

	/** The `added` event. **/
	var Added: DesktopCaptureMonitorEvent<(String, String, Int, String, ?Bool) -> Void> = "added";

	/** The `namechanged` event. **/
	var NameChanged: DesktopCaptureMonitorEvent<(String, String) -> Void> = "namechanged";

	/** The `orderchanged` event. **/
	var OrderChanged: DesktopCaptureMonitorEvent<(String, Int, Int) -> Void> = "orderchanged";

	/** The `removed` event. **/
	var Removed: DesktopCaptureMonitorEvent<Int -> Void> = "removed";

	/** The `thumbnailchanged` event. **/
	var ThumbnailChanged: DesktopCaptureMonitorEvent<(String, String) -> Void> = "thumbnailchanged";
}

/** Defines the desktop media sources used in `Screen.chooseDesktopMedia()` method. **/
enum abstract DesktopMediaSource(String) {

	/** The media source is a screen. **/
	var Screen = "screen";

	/** The media source is a window. **/
	var Window = "window";
}

/** A collection of APIs to query the screens connected to the computer. **/
@:native("nw.Screen")
extern class Screen {

	/** The object used to monitor the changes of screens and windows on the desktop. **/
	static final DesktopCaptureMonitor: DesktopCaptureMonitor;

	/** The list of screens connected to the computer. **/
	static final screens: Array<ScreenDefinition>;

	/** Initializes the `Screen` singleton object. **/
	static function Init(): Void;

	/** Adds a `listener` that will be invoked whenever the specified `event` is triggered. **/
	static function addListener<T: Function>(event: ScreenEvent<T>, listener: T): Screen;

	/** Shows the desktop media picker UI with the specified set of `sources`. **/
	static function chooseDesktopMedia(sources: Array<DesktopMediaSource>, callback: EitherType<Bool, String> -> Void): Void;

	/** Removes the specified `listener` for the given `event`. **/
	static function off<T: Function>(event: ScreenEvent<T>, listener: T): Screen;

	/** Adds a `listener` that will be invoked whenever the specified `event` is triggered. **/
	static function on<T: Function>(event: ScreenEvent<T>, listener: T): Screen;

	/** Adds a one-time `listener` that will be removed and then invoked whenever the next time `event` is triggered. **/
	static function once<T: Function>(event: ScreenEvent<T>, listener: T): Screen;

	/** Removes the specified `listener` for the given `event`. **/
	static function removeListener<T: Function>(event: ScreenEvent<T>, listener: T): Screen;
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
