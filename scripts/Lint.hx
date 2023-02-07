/** Runs the script. **/
function main() Sys.command("lix", ["run", "checkstyle",
	"--config", "etc/checkstyle.json",
	"--exitcode",
	"--source", "scripts",
	"--source", "src"
]);
