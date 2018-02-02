#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];

  FlutterViewController* controller = (UINavigationController*)self.window.rootViewController;
  FlutterMethodChannel* platformChannel =
      [FlutterMethodChannel methodChannelWithName:@"t33.test.flutter.io/native"
                                  binaryMessenger:controller];
  [platformChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
    UIViewController* modalVC =
        [[UIStoryboard storyboardWithName:@"Main"
                                   bundle:nil] instantiateViewControllerWithIdentifier:@"second"];
    [controller presentViewController:modalVC animated:YES completion:nil];
  }];

  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
