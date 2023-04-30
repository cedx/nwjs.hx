//! --class-path src
import nwjs.Version;
import sys.FileSystem;
import sys.io.File;
using Lambda;

/** Builds the documentation. **/
function main() {
	["CHANGELOG.md", "LICENSE.md"].iter(file -> File.copy(file, 'docs/${file.toLowerCase()}'));
	if (FileSystem.exists("docs/api")) Tools.removeDirectory("docs/api");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", ["run", "dox",
		"--define", "description", "Type definitions for using NW.js with Haxe.",
		"--define", "source-path", "https://github.com/cedx/nwjs.hx/blob/main/src",
		"--define", "themeColor", "0xea8220",
		"--define", "version", Version.packageVersion,
		"--define", "website", "https://docs.belin.io/nwjs.hx",
		"--include", "js\\.Nw",
		"--include", "js\\.nw\\.*",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "Haxe Externs for NW.js",
		"--toplevel-package", "js"
	]);

	File.copy("docs/favicon.ico", "docs/api/favicon.ico");
}
