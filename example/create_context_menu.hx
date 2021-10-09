import js.Browser;
import js.nw.Menu;
import js.nw.MenuItem;

/** Creates a native context menu. **/
function main() {
	final contextMenu = new Menu();
	contextMenu.append(new MenuItem({label: "Item A"}));
	contextMenu.append(MenuItem.newSeparator());
	contextMenu.append(new MenuItem({
		type: Checkbox,
		label: "Item B",
		icon: "img/icon.png",
		key: "s",
		modifiers: "ctrl+alt",
		click: () -> Browser.alert("You have activated 'Item B'")
	}));

	Browser.document.body.addEventListener("contextmenu", event -> {
		event.preventDefault();
		contextMenu.popup(event.x, event.y);
	});
}
