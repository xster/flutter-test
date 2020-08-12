#import "IosImage.h"

#if !__has_feature(objc_arc)
#error ARC must be enabled!
#endif

@implementation IosImage
+ (void)registerHandlerWithMessenger:(NSObject<FlutterBinaryMessenger>*)binaryMessenger {
  FlutterMethodChannel* channel =
      [FlutterMethodChannel methodChannelWithName:@"plugins.flutter.io/ios_platform_images"
                                  binaryMessenger:binaryMessenger];

  [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
    if ([@"loadImage" isEqualToString:call.method]) {
      NSString* name = call.arguments;
      UIImage* image = [UIImage systemImageNamed:name withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:36]];
      NSData* data = UIImagePNGRepresentation(image);
      if (data) {
        result(@{
          @"scale" : @(image.scale),
          @"data" : [FlutterStandardTypedData typedDataWithBytes:data],
        });
      } else {
        result(nil);
      }
      return;
    }
    result(FlutterMethodNotImplemented);
  }];
}
@end
