package js.nw;

/** Represents a menubar or a context menu. **/
@:native("nw.Menu")
extern class Menu {

	/** The menu items. **/
	final items: Array<MenuItem>;

	/** Creates a new menu. **/
	function new(?options: {type: MenuType});

	/** Creates a new menubar. **/
	static inline function newMenubar(): Menu
		return new Menu({type: MenuBar});

	/** Append an `item` to the tail of this menu. **/
	function append(item: MenuItem): Void;

	/** Creates the built-in menus within the menubar on Mac. **/
	function createMacBuiltin(appName: String, ?options: {?hideEdit: Bool, ?hideWindow: Bool}): Void;

	/** Inserts the specified `item` at the given `position` of this menu. **/
	function insert(item: MenuItem, position: Int): Void;

	/** Popups this context menu at the specified point in the current window. **/
	function popup(x: Int, y: Int): Void;

	/** Removes the specified `item` from this menu **/
	function remove(item: MenuItem): Void;

	/** Removes the item at the specified `position` from this menu. **/
	function removeAt(position: Int): Void;
}

/** Defines the type of a menu. **/
enum abstract MenuType(String) to String {

	/** It's a context menu. **/
	var ContextMenu = "contextmenu";

	/** It's a menubar. **/
	var MenuBar = "menubar";
}
