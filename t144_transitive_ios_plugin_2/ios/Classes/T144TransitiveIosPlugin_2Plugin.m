#import "T144TransitiveIosPlugin_2Plugin.h"
#if __has_include(<t144_transitive_ios_plugin_2/t144_transitive_ios_plugin_2-Swift.h>)
#import <t144_transitive_ios_plugin_2/t144_transitive_ios_plugin_2-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "t144_transitive_ios_plugin_2-Swift.h"
#endif

@implementation T144TransitiveIosPlugin_2Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftT144TransitiveIosPlugin_2Plugin registerWithRegistrar:registrar];
}
@end
