```html
gem install thrift -v '0.11.0.0'
Building native extensions. This could take a while...
ERROR:  Error installing thrift:
	ERROR: Failed to build gem native extension.
```

### fixed

```bash
brew tap-new $USER/local-tap
brew extract --version='0.11.0' thrift $USER/local-tap
brew install thrift@0.11.0
```

gem install thrift -v 0.11.0.0 -- --with-cppflags="-Wno-compound-token-split-by-macro"
