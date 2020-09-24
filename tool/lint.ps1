#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)
haxelib run checkstyle --config etc/checkstyle.json --source src
