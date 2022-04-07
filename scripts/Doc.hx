import haxe.Json;
import sys.FileSystem;
import sys.io.File;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("docs")) Tools.removeDirectory("docs");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", [
		"run", "dox",
		"--define", "description", "Type definitions for using NW.js with Haxe.",
		"--define", "source-path", "https://github.com/cedx/nwjs.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Json.parse(File.getContent("haxelib.json")).version,
		"--define", "website", "https://github.com/cedx/nwjs.hx",
		"--include", "js\\.Nw",
		"--include", "js\\.nw\\.*",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Haxe Externs for NW.js",
		"--toplevel-package", "js"
	]);

	File.copy("www/favicon.ico", "docs/favicon.ico");
}
