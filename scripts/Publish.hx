//! --class-path src
import nwjs.Version;

/** Runs the script. **/
function main() {
	Tools.compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "src"], "var/haxelib.zip");
	Sys.command("haxelib", ["submit", "var/haxelib.zip"]);
	for (action in [["tag"], ["push", "origin"]]) Sys.command("git", action.concat(['v${Version.packageVersion}']);
}
