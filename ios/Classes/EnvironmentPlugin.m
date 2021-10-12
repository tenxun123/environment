#import "EnvironmentPlugin.h"

@implementation EnvironmentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"environment"
            binaryMessenger:[registrar messenger]];
  EnvironmentPlugin* instance = [[EnvironmentPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"getAppVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:@"1.0.0"]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
