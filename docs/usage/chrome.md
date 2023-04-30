# Chrome APIs
[NW.js](https://nwjs.io) supports all APIs in the [Chrome Apps](https://developer.chrome.com/apps/api_index) platform
and some APIs in the [Chrome Extensions](https://developer.chrome.com/extensions/api_index) platform.

**This library does not provide any extern for these APIs.** If you need to consume Chrome APIs from your application,
you will need to install one of the following [Haxelib](https://lib.haxe.org) packages:

- [chrome-app](https://lib.haxe.org/p/chrome-app) : provides externs for the Chrome Apps APIs.
- [chrome-extension](https://lib.haxe.org/p/chrome-extension) : provides externs for the Chrome Extensions APIs.

!> Chrome will be removing support for **Chrome Apps** on all platforms. **Chrome Extensions** will continue to be supported.  
[Read the announcement](https://blog.chromium.org/2020/01/moving-forward-from-chrome-apps.html)
and learn more about [migrating your application](https://developers.chrome.com/apps/migration).
