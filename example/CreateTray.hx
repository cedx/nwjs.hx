import js.nw.Menu;
import js.nw.MenuItem;
import js.nw.Tray;

/** Adds a system tray icon to the notification area. **/
function main() {
	final menu = new Menu();
	menu.append(new MenuItem({type: Checkbox, label: "Box 1"}));

	var tray = new Tray({
		title: "Tray",
		icon: "img/icon.png",
		menu: menu
	});

	tray.on(TrayEvent.Click, () -> {
		tray.remove();
		tray = null;
	});
}
