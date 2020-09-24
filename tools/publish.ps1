#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1

$files = "*.md", "extraParams.hxml", "haxelib.json", "src"
Compress-Archive $files var/haxelib.zip -Force
haxelib submit var/haxelib.zip

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
git tag "v$version"
git push origin "v$version"
