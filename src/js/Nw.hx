package js;

import js.Node.process;

/** The top-level NW.js object. **/
@:native("nw")
extern class Nw {

	/** The build flavor of NW.js. **/
	static var flavor(get, never): NwFlavor;

	/** The version number of NW.js. **/
	static var version(get, never): String;

	/** Gets the build flavor of NW.js. **/
	static inline function get_flavor(): NwFlavor
		return process.versions["nw-flavor"];

	/** Gets the version number of NW.js. **/
	static inline function get_version(): String
		return process.versions["nw"];
}

/** Defines the NW.js build flavors. **/
enum abstract NwFlavor(String) from String {

	/** The NW.js binary is a normal build. **/
	var Normal = "normal";

	/** The NW.js binary is an SDK build. **/
	var Sdk = "sdk";
}

/** Defines the platforms supported by NW.js. **/
enum abstract NwPlatform(String) {

	/** The platform is Linux. **/
	var Linux;

	/** The platform is Apple macOS. **/
	var Mac;

	/** The platform is Microsoft Windows. **/
	var Windows;
}
