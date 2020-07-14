#import "AndroidHtmleditorPlugin.h"
#if __has_include(<android_htmleditor/android_htmleditor-Swift.h>)
#import <android_htmleditor/android_htmleditor-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "android_htmleditor-Swift.h"
#endif

@implementation AndroidHtmleditorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAndroidHtmleditorPlugin registerWithRegistrar:registrar];
}
@end
