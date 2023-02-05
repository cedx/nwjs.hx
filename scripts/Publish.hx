//! --class-path src
import nwjs.Version;

/** Runs the script. **/
function main() {
	Sys.command("npm publish");
	for (action in ["tag", "push origin"]) Sys.command('git $action v${Version.packageVersion}');
}
