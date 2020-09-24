#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

haxelib newrepo
haxelib install checkstyle
haxelib install dox
haxelib install all --always
