# Usage
**Haxe externs for NW.js** provides type definitions for developing desktop application with the [NW.js](https://nwjs.io) framework.

If you haven't used [NW.js](https://nwjs.io) before, be sure to check out the [related documentation](https://docs.nwjs.io), as it explains how to create such applications.

For more information about type definitions, see [Externs](https://haxe.org/manual/lf-externs.html) in the [Haxe manual](https://haxe.org/manual/). 

## Writing an application

### Use the DOM APIs
TODO

### Use the Node.js APIs
TODO

### Use the Chrome APIs
[NW.js](https://nwjs.io) supports all APIs in the [Chrome Apps](https://developer.chrome.com/apps/api_index) platform and some APIs in the [Chrome Extensions](https://developer.chrome.com/extensions/api_index) platform.

This library does not provide any extern for these APIs. If you need to consume Chrome APIs from your application, you will need to install one of the following [Haxelib](https://lib.haxe.org) packages:

- [`chrome-app`](https://lib.haxe.org/p/chrome-app) : provides externs for the Chrome Apps APIs.
- [`chrome-extension`](https://lib.haxe.org/p/chrome-extension) : provides externs for the Chrome Extensions APIs.

!!! warning
	Chrome will be removing support for **Chrome Apps** on all platforms. **Chrome Extensions** will continue to be supported. [Read the announcement](https://blog.chromium.org/2020/01/moving-forward-from-chrome-apps.html) and learn more about [migrating your application](https://developers.chrome.com/apps/migration).

## Haxe specifics

### The `nwjs` compiler flag
This library defines the `nwjs` conditional compilation flag.

This flag is useful if you are developing in parallel a web application and a desktop one based on the same code base.
It let you create different branches in your code... For example:

```haxe
TODO
```

For more information, see [Conditional Compilation](https://haxe.org/manual/lf-condition-compilation.html) in the [Haxe manual](https://haxe.org/manual/).
