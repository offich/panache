## Getting Started

Before running panache on devtool extensions, you should execute below commands.
Since this extension is standalone, `import 'package:panache/panache.dart';` statement is not necessary.

```txt
$ cd /path/to/root/of/this/repository
$ fvm dart run devtools_extensions build_and_copy --source=. --dest=./example/extension/devtools
$ cd example
$ fvm flutter run
```
