#import "T144TransitiveIosPlugin.h"
#if __has_include(<t144_transitive_ios_plugin/t144_transitive_ios_plugin-Swift.h>)
#import <t144_transitive_ios_plugin/t144_transitive_ios_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "t144_transitive_ios_plugin-Swift.h"
#endif

@implementation T144TransitiveIosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftT144TransitiveIosPlugin registerWithRegistrar:registrar];
}
@end
