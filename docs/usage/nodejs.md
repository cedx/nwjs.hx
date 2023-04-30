# Node.js APIs
Access to the Node.js APIs is provided by the externs of the [`hxnodejs` package](https://lib.haxe.org/p/hxnodejs), which is a dependency of this library.
Most Node.js APIs are located in the `js.node` namespace and are consumed as is:

```haxe
import js.Node.process;
import js.Node.require;
import js.node.ChildProcess;
import js.node.Fs;

function main() {
  // Log the operating system platform and processor architecture to the console.
  trace('This platform is ${process.platform} on ${process.arch}.');

  // Read/write some text to the file system.
  Fs.writeFileSync("message.txt", "Hello from NW.js!");
  trace(Fs.readFileSync("message.txt", "utf8"));

  // Spawn a new process.
  ChildProcess.spawn("ls", ["-lh", "/usr"]);

  // Import an external JavaScript module.
  final module = require("./path/to/module.js");
}
```

API documentation for the `hxnodejs` externs is available at the following address:  
[https://haxefoundation.github.io/hxnodejs](https://haxefoundation.github.io/hxnodejs)

> For changes made by NW.js to the Node.js APIs,
see [Changes to Node](https://docs.nwjs.io/en/latest/References/Changes%20to%20Node) in the [NW.js documentation](https://docs.nwjs.io).
