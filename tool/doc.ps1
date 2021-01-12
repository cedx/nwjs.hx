#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe --define doc-gen --xml var/api.xml build.hxml
haxelib run dox `
	--define description "Type definitions for using NW.js with Haxe." `
	--define source-path "https://git.belin.io/cedx/nwjs.hx/src/branch/main/src" `
	--define themeColor 0xffc105 `
	--define version $version `
	--define website "https://docs.belin.io/nwjs.hx" `
	--include "^js\.Nw" `
	--include "^js\.nw\." `
	--input-path var `
	--output-path docs/api `
	--title "Haxe externs for NW.js" `
	--toplevel-package js

Copy-Item docs/favicon.ico docs/api
