package js.nw;

/** A collection of APIs that do desktop related jobs. **/
@:native("nw.Shell")
extern class Shell {

	/** Opens the given external URI in the desktop's default manner. **/
	static function openExternal(url: String): Void;

	/** Opens the given file path in the desktop's default manner. **/
	static function openItem(filePath: String): Void;

	/** Shows the given file path in the parent folder with the file manager. **/
	static function showItemInFolder(filePath: String): Void;
}
