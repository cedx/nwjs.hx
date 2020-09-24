# Installation

## Requirements
Before installing **Haxe externs for NW.js**, you need to make sure you have [Haxe](https://haxe.org)
and [Haxelib](https://lib.haxe.org), the Haxe package manager, up and running.
		
You can verify if you're already good to go with the following commands:

``` shell
haxe --version
# 4.1.4

haxelib version
# 4.0.2
```

!!! info
	If you plan to play with the package sources, you will also need
	[PowerShell](https://docs.microsoft.com/en-us/powershell) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material).

## Installing with Haxelib package manager

### 1. Install it
From a command prompt, run:

``` shell
haxelib install nwjs
```

### 2. Import it
Now in your [Haxe](https://haxe.org) code, you can use:

``` haxe
import js.nw.*;
```
