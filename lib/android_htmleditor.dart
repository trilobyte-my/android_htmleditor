import 'dart:async';

import 'package:flutter/services.dart';

class AndroidHtmleditor {
  static const MethodChannel _channel =
      const MethodChannel('android_htmleditor');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// NB: Throws PlatformException if Back button is pressed
  static Future<String> edit(String content) async {
    return await _channel.invokeMethod('edit', {'content': content});
  }
}
