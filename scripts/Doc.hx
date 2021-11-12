import Sys.*;
import Tools.removeDirectory;
import haxe.Json;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs")) removeDirectory("docs");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "Type definitions for using NW.js with Haxe.",
		"--define", "source-path", "https://bitbucket.org/cedx/nwjs.hx/src/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Json.parse(getContent("haxelib.json")).version,
		"--define", "website", "https://bitbucket.org/cedx/nwjs.hx",
		"--include", "js\\.Nw",
		"--include", "js\\.nw\\.*",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Haxe Externs for NW.js",
		"--toplevel-package", "js"
	]);

	copy("www/favicon.ico", "docs/favicon.ico");
}
