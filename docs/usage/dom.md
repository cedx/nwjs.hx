# DOM APIs
Nothing special is required to access the DOM APIs, just write your application in the usual way.

```haxe
import js.Browser.alert;
import js.Browser.navigator;

function main() {
  // Log the user agent string to the console.
  trace(navigator.userAgent);

  // Display an alert message box.
  alert("Hello from NW.js!");
}
```

> For changes made by NW.js to the DOM APIs,
see [Changes to DOM](https://docs.nwjs.io/en/latest/References/Changes%20to%20DOM) in the [NW.js documentation](https://docs.nwjs.io).
