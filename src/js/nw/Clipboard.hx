package js.nw;

/** An abstraction of the clipboard. **/
@:native("nw.Clipboard")
extern class Clipboard {

	/** Returns the clipboard object. **/
	static function get(): Clipboard;

	/** Clears the clipboard. **/
	function clear(): Void;

	/** Gets the data from the clipboard. **/
	overload function get(data: ClipboardOptions): String;
	overload function get(dataList: Array<ClipboardOptions>): Array<ClipboardData>;
	overload function get(type: ClipboardDataType = Text, raw: Bool = false): String;

	/** Returns the list of available types of data in clipboard. **/
	function readAvailableTypes(): Array<ClipboardDataType>;

	/** Writes the specified `data` to the clipboard. **/
	overload function set(data: ClipboardData): Void;
	overload function set(dataList: Array<ClipboardData>): Void;
	overload function set(data: String, type: ClipboardDataType = Text, raw: Bool = false): Void;
}

/** Represents data from the clipboard. **/
typedef ClipboardData = {

	/** The clipboard data. **/
	var data: String;

	/** Value indicating whether to require raw image data. **/
	var ?raw: Bool;

	/** The type of clipboard data.  **/
	var type: ClipboardDataType;
}

/** Defines the type of clipboard data. **/
enum abstract ClipboardDataType(String) from String to String {

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

/** Defines the options of the `Clipboard.get()` method. **/
typedef ClipboardOptions = {

	/** Value indicating whether to require raw image data. **/
	var ?raw: Bool;

	/** The type of clipboard data.  **/
	var type: ClipboardDataType;
}
