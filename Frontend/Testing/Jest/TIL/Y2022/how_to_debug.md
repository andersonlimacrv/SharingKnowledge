[how to debug](https://artsy.github.io/blog/2018/08/24/How-to-debug-jest-tests/)


```html
1. First, insert a new line in your test where you think it might be failing and type debugger. This will serve as a break point for the debugger to stop at.
2. Open up Chrome and type in the address bar : chrome://inspect
3. Click on “Open dedicated DevTools for Node”
4. In your terminal, instead of typing yarn jest <path_to_test>, type this:

`node --inspect node_modules/.bin/jest --runInBand <path_to_test>`

Or you can add it to your package.json as a script:


  {
    "scripts" : {
+    "test:debug": "node --inspect node_modules/.bin/jest --runInBand",
    }
  }

```
