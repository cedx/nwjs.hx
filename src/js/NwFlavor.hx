package js;

/** Defines the NW.js build flavors. **/
enum abstract NwFlavor(String) {

	/** The NW.js binary is a normal build. **/
	var Normal = "normal";

	/** The NW.js binary is an SDK build. **/
	var Sdk = "sdk";
}
