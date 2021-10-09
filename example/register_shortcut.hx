import js.Lib;
import js.nw.App;
import js.nw.Shortcut;

/** Registers a global keyboard shortcut. **/
function main() {
	final shortcut = new Shortcut({key : "Ctrl+Shift+A"});
	shortcut.on(Active, () -> {
		final self: Shortcut = Lib.nativeThis;
		trace('Global desktop keyboard shortcut: ${self.key} active.');
	});

	App.registerGlobalHotKey(shortcut);
}
