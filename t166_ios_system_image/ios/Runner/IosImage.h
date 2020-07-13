#import <Flutter/Flutter.h>

@interface IosImage: NSObject
+ (void)registerHandlerWithMessenger:(NSObject<FlutterBinaryMessenger>*)binaryMessenger;
@end
