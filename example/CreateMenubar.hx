import js.nw.Menu;
import js.nw.MenuItem;
import js.nw.Window;

/** Creates and sets the menubar. **/
function main() {
	final submenu = new Menu();
	submenu.append(new MenuItem({label: "Item A"}));
	submenu.append(new MenuItem({label: "Item B"}));

	final menubar = Menu.newMenubar();
	if (Sys.systemName() == "Mac") menubar.createMacBuiltin("My App");
	menubar.append(new MenuItem({
		label: "First Menu",
		submenu: submenu
	}));

	Window.get().menu = menubar;
}
