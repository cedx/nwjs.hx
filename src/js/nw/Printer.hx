package js.nw;

/** Represents the settings of custom margins. **/
typedef PrintCustomMargins = {

	/** The bottom margin. **/
	marginBottom: Int,

	/** The left margin. **/
	marginLeft: Int,

	/** The right margin. **/
	marginRight: Int,

	/** The top margin. **/
	marginTop: Int
}

/** Defines the type of print margins. **/
enum abstract PrintMarginsType(Int) to Int {

	/** Use the default margins. **/
	var Default;

	/** Do not use margins. **/
	var NoMargins;

	/** Use the minimum margins. **/
	var Minimum;

	/** Use custom margins. **/
	var Custom;
}

/** Represents a paper size specification. **/
typedef PrintMediaSize = {

	/** The custom display name. **/
	custom_display_name: String,

	/** The media height. **/
	height_microns: Int,

	/** Value indicating whether this media size is the default one. **/
	is_default: Bool,

	/** The media name. **/
	name: String,

	/** The media width. **/
	width_microns: Int
}

/** Defines the options of the `Window.print()` method. **/
typedef PrintOptions = {

	/** Value indicating whether to print without the need for user's interaction. **/
	?autoprint: Bool,

	/** The number of copies to print. **/
	?copies: Int,

	/** The string to replace the URL in the footer. **/
	?footerString: String,

	/** The string to replace the URL in the header. **/
	?headerString: String,

	/** Value indicating whether to use landscape or portrait. **/
	?landscape: Bool,

	/** The settings of custom margins. **/
	?marginsCustom: PrintCustomMargins,

	/** The type of printer margins. **/
	?marginsType: PrintMarginsType,

	/** The paper size specification. **/
	?mediaSize: PrintMediaSize,

	/** The path of the output file when printing to PDF. **/
	?pdf_path: String,

	/** The device name of the printer. **/
	?printer: String,

	/** The scale factor. **/
	?scaleFactor: Int,

	/** Value indicating whether to print CSS backgrounds. **/
	?shouldPrintBackgrounds: Bool,

	/** Value indicating whether to hide the flashing print preview dialog. **/
	?silent: Bool
}

/** Represents a printer. **/
typedef Printer = {

	/** The device name. **/
	deviceName: String,

	/** The printer description. **/
	printerDescription: String,

	/** The printer name. **/
	printerName: String,

	/** The printer options. **/
	printerOptions: PrinterOptions
}

/** Defines the options of a `Printer` instance. **/
extern interface PrinterOptions {

	/** The printer location. **/
	@:native("printer-location")
	var printerLocation: String;

	/** The printer make and model. **/
	@:native("printer-make-and-model")
	var printerMakeAndModel: String;

	/** Information about the system driver. **/
	@:native("system_driverinfo")
	var systemDriverInfo: String;
}
