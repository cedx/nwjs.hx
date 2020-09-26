package js.nw;

import haxe.Constraints.Function;
import js.node.events.EventEmitter;

/** Represents an item in a menu. **/
@:native("nw.MenuItem")
extern class MenuItem extends EventEmitter<MenuItem> {

	/** Value indicating whether the checkbox is checked. **/
	var checked: Bool;

	/** Value indicating whether this item is enabled. **/
	var enabled: Bool;

	/** The item icon. **/
	var icon: String;

	/** Value indicating whether the item icon is treated as a template. **/
	var iconIsTemplate: Bool;

	/** The key of the shortcut. **/
	var key: String;

	/** The item label. **/
	var label: String;

	/** The modifiers of the shortcut. **/
	var modifiers: String;

	/** The item submenu. **/
	var submenu: Menu;

	/** The item tooltip. **/
	var tooltip: String;

	/** The item type. **/
	final type: MenuItemType;

	/** Creates a new menu item. **/
	function new(options: MenuItemOptions);

	/** Creates a new menu separator. **/
	inline static function newSeparator(): MenuItem
		return new MenuItem({type: Separator});

	/** The callback invoked when the user activates this item. **/
	dynamic function click(): Void;
}

/** Defines the events of a `MenuItem` instance. **/
enum abstract MenuItemEvent<T: Function>(Event<T>) to Event<T> {

	/** The `click` event. **/
	var Click: MenuItemEvent<Void -> Void> = "click";
}

/** Defines the options of a `MenuItem` instance. **/
typedef MenuItemOptions = {

	/** Value indicating whether the checkbox is checked. **/
	var ?checked: Bool;

	/** The callback to invoke when the user activates the item. **/
	var ?click: () -> Void;

	/** Value indicating whether the item is enabled. **/
	var ?enabled: Bool;

	/** The item icon. **/
	var ?icon: String;

	/** The key of the shortcut. **/
	var ?key: String;

	/** The item label. **/
	var ?label: String;

	/** The modifiers of the shortcut. **/
	var ?modifiers: String;

	/** The item submenu. **/
	var ?submenu: Menu;

	/** The item tooltip. **/
	var ?tooltip: String;

	/** The item type. **/
	var ?type: MenuItemType;
}

/** Defines the type of a menu item. **/
enum abstract MenuItemType(String) {

	/** The menu item has a checkbox. **/
	var Checkbox = "checkbox";

	/** The menu item is standard. **/
	var Normal = "normal";

	/** The menu item is a separator. **/
	var Separator = "separator";
}
