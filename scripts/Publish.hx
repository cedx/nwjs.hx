import Sys.*;
import Tools.compress;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "src"], "var/haxelib.zip");
	command("haxelib submit var/haxelib.zip");

	final version = Json.parse(getContent("haxelib.json")).version;
	for (action in ["tag", "push origin"]) command('git $action v$version');
}
