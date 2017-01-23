#### 0.1.3
* Change scaffolding initialization from `moda` to `morb`.
* Change file extension to `mo.rb` so editors automagically do ruby syntax highlighting.
* Change JSON file extension argument from `-f` (usually file or force) to `-e` for extension.
* Docs location changed from https://docs.modabl.es to https://modabl.es/docs.

#### 0.1.2
* Replace `gen` scaffold with `moda`.
* Add `--version` flag
* Add `--file-ext` file extension option
* Change file extension to `.moda`
* Change `destination_file_suffix` to `file_ext`
* Append dirs from config file to `Dir.pwd`
* Remove `-d` option since the logic changed
* DSL can now run without a config file
* Remove `:json` support for non-hash data types
* Add `:dash` helper to convert underscore to dashes since ruby does not support dashes for method names.

#### 0.1.0
* Initial release
