package js.nw;

/** An abstraction of the clipboard. **/
@:native("nw.Clipboard")
extern class Clipboard {

	/** Returns the clipboard object. **/
	static function get(): Clipboard;

	/** Clears the clipboard. **/
	function clear(): Void;

	/** Gets the data from the clipboard. **/
	@:overload(function(data: ClipboardData): String {})
	@:overload(function(dataList: Array<ClipboardData>): String {})
	function get(type: ClipboardDataType = Text, raw: Bool = false): String;

	/** Returns the list of available types of data in clipboard. **/
	function readAvailableTypes(): Array<ClipboardDataType>;

	/** Writes the specified `data` to the clipboard. **/
	@:overload(function(data: ClipboardData): Void {})
	@:overload(function(dataList: Array<ClipboardData>): Void {})
	function set(data: String, type: ClipboardDataType = Text, raw: Bool = false): Void;
}

/** Defines the options of clipboard data. **/
typedef ClipboardData = {

	/** The clipboard data. **/
	var data: String;

	/** Value indicating whether to require raw image data. **/
	var ?raw: Bool;

	/** The type of clipboard data.  **/
	var ?type: ClipboardDataType;
}

/** Defines the type of clipboard data. **/
enum abstract ClipboardDataType(String) to String {

	/** The clipboard data is an HTML string. **/
	var Html = "html";

	/** The clipboard data is a JPEG image. **/
	var Jpeg = "jpeg";

	/** The clipboard data is a PNG image. **/
	var Png = "png";

	/** The clipboard data is Rich Text Format. **/
	var Rtf = "rtf";

	/** The clipboard data is plain text. **/
	var Text = "text";
}
