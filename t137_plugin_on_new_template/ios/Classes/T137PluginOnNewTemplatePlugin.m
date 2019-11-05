#import "T137PluginOnNewTemplatePlugin.h"
#import <t137_plugin_on_new_template/t137_plugin_on_new_template-Swift.h>

@implementation T137PluginOnNewTemplatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftT137PluginOnNewTemplatePlugin registerWithRegistrar:registrar];
}
@end
