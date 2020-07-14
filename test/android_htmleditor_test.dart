import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_htmleditor/android_htmleditor.dart';

void main() {
  const MethodChannel channel = MethodChannel('android_htmleditor');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AndroidHtmleditor.platformVersion, '42');
  });
}
