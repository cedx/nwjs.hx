import js.nw.Window;

/** Opens a new window. **/
function main() {
	Window.open("https://nwjs.io", newWindow -> {
		newWindow.on(Closed, () -> newWindow = null);
		newWindow.on(Focus, () -> trace('New window is focused'));
	});
}
