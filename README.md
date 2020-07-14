# Android Html Editor

Flutter plugin for Knife Editor (Android) from https://github.com/mthli/Knife.

Does not work in iOS, check for Platform using

```
import 'dart:io' show Platform;

if (Platform.isAndroid) {
    AndroidHtmleditor.edit(html).then((_) {
        setState(() {
            html = _;
        });
    });
} else {
  // other platform-specific code
}
```
