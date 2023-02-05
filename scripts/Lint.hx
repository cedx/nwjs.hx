/** Runs the script. **/
function main()
	Sys.command("lix run checkstyle --config etc/checkstyle.json --source scripts --source src");
