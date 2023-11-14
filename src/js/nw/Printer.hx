package js.nw;

/** Represents the settings of custom margins. **/
typedef PrintCustomMargins = {

	/** The bottom margin. **/
	var marginBottom: Int;

	/** The left margin. **/
	var marginLeft: Int;

	/** The right margin. **/
	var marginRight: Int;

	/** The top margin. **/
	var marginTop: Int;
}

/** Defines the type of print margins. **/
enum abstract PrintMarginsType(Int) from Int to Int {

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
	var custom_display_name: String;

	/** The media height. **/
	var height_microns: Int;

	/** Value indicating whether this media size is the default one. **/
	var is_default: Bool;

	/** The media name. **/
	var name: String;

	/** The media width. **/
	var width_microns: Int;
}

/** Defines the options of the `Window.print()` method. **/
typedef PrintOptions = {

	/** Value indicating whether to print without the need for user's interaction. **/
	var ?autoprint: Bool;

	/** The number of copies to print. **/
	var ?copies: Int;

	/** The string to replace the URL in the footer. **/
	var ?footerString: String;

	/** The string to replace the URL in the header. **/
	var ?headerString: String;

	/** Value indicating whether to use landscape or portrait. **/
	var ?landscape: Bool;

	/** The settings of custom margins. **/
	var ?marginsCustom: PrintCustomMargins;

	/** The type of printer margins. **/
	var ?marginsType: PrintMarginsType;

	/** The paper size specification. **/
	var ?mediaSize: PrintMediaSize;

	/** The path of the output file when printing to PDF. **/
	var ?pdf_path: String;

	/** The device name of the printer. **/
	var ?printer: String;

	/** The scale factor. **/
	var ?scaleFactor: Int;

	/** Value indicating whether to print CSS backgrounds. **/
	var ?shouldPrintBackgrounds: Bool;

	/** Value indicating whether to hide the flashing print preview dialog. **/
	var ?silent: Bool;
}

/** Represents a printer. **/
typedef Printer = {

	/** The device name. **/
	var deviceName: String;

	/** The printer description. **/
	var printerDescription: String;

	/** The printer name. **/
	var printerName: String;

	/** The printer options. **/
	var printerOptions: PrinterOptions;
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
