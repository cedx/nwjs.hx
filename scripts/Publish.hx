import haxe.Json;
import sys.io.File;

/** Runs the script. **/
function main() {
	Tools.compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "src"], "var/haxelib.zip");
	Sys.command("haxelib submit var/haxelib.zip");

	final version = Json.parse(File.getContent("haxelib.json")).version;
	for (action in ["tag", "push origin"]) Sys.command('git $action v$version');
}
