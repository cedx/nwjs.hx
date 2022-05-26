import {createWriteStream, existsSync, readFileSync} from "node:fs";
import {cp, rm} from "node:fs/promises";
import archiver from "archiver";
import del from "del";
import {execa} from "execa";
import log from "fancy-log";
import gulp from "gulp";
import replace from "gulp-replace";

// The package configuration.
const pkg = JSON.parse(readFileSync("haxelib.json", "utf8"));

/** Deletes all generated files and reset any saved state. */
export function clean() {
	return del(["lib", "res", "var/**/*"]);
}

/** Builds the documentation. */
export async function doc() {
	await rm("docs", {force: true, recursive: true});
	await exec("haxe", ["--define", "doc-gen", "--no-output", "--xml", "var/api.xml", "build.hxml"]);
	await exec("lix", [
		"run", "dox",
		"--define", "description", "Type definitions for using NW.js with Haxe.",
		"--define", "source-path", "https://github.com/cedx/nwjs.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", pkg.version,
		"--define", "website", "https://github.com/cedx/nwjs.hx",
		"--include", "js\\.Nw",
		"--include", "js\\.nw\\.*",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Haxe Externs for NW.js",
		"--toplevel-package", "js"
	]);

	return cp("www/favicon.ico", "docs/favicon.ico");
}

/** Installs the project dependencies. */
export async function install() {
	await exec("lix", ["download"]);
	return exec("npm", [existsSync("package-lock.json") ? "install" : "update"]);
}

/** Performs the static analysis of source code. */
export async function lint() {
	await exec("lix", ["run", "checkstyle", "--config", "etc/checkstyle.json", "--exitcode", "--source", "src"]);
	return exec("tsc", ["--project", "jsconfig.json"]);
}

/** Publishes the package in the registry. */
export async function publish() {
	await rm("var/haxelib.zip", {force: true});

	const archive = archiver("zip");
	const output = createWriteStream("var/haxelib.zip");
	archive.on("error", error => { throw error; }).pipe(output);
	archive.glob("*.md").glob("haxelib.json").directory("src", "src").finalize();

	for (const command of [["tag"], ["push", "origin"]]) await exec("git", [...command, `v${pkg.version}`]);
	log("The package is ready to be published using 'haxelib submit var/haxelib.zip'.");
}

/** Updates the version number in the sources. */
export function version() {
	return gulp.src("package.json").pipe(replace(/"version": "\d+(\.\d+){2}"/, `"version": "${pkg.version}"`)).pipe(gulp.dest("."));
}

/** Runs the default task. */
export default gulp.series(
	clean,
	version
);

/**
 * Runs the specified command.
 * @param {string} command The command to run.
 * @param {string[]} [args] The command arguments.
 * @param {import("execa").Options} [options] The child process options.
 * @returns {import("execa").ExecaChildProcess} Resolves when the command is finally terminated.
 */
function exec(command, args = [], options = {}) {
	return execa(command, args, {preferLocal: true, stdio: "inherit", ...options});
}
