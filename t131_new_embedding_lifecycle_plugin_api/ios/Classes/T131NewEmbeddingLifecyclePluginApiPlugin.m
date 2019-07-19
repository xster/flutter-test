#import "T131NewEmbeddingLifecyclePluginApiPlugin.h"

@implementation T131NewEmbeddingLifecyclePluginApiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"t131_new_embedding_lifecycle_plugin_api"
            binaryMessenger:[registrar messenger]];
  T131NewEmbeddingLifecyclePluginApiPlugin* instance = [[T131NewEmbeddingLifecyclePluginApiPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
