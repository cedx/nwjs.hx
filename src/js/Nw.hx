package js;

import js.Node.process;

/** The top-level NW.js object. **/
@:native("nw")
extern class Nw {

	/** The build flavor of NW.js. **/
	static var flavor(get, never): NwFlavor;
		static inline function get_flavor(): NwFlavor
			return process.versions["nw-flavor"];

	/** The version number of NW.js. **/
	static var version(get, never): String;
		static inline function get_version(): String
			return process.versions["nw"];
}

/** Defines the NW.js build flavors. **/
enum abstract NwFlavor(String) from String to String {

	/** The NW.js binary is a normal build. **/
	var Normal = "normal";

	/** The NW.js binary is an SDK build. **/
	var Sdk = "sdk";
}
