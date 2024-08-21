#import "FlutterLocalTimezonePlugin.h"
#import <Flutter/Flutter.h>

@implementation FlutterLocalTimezonePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_local_timezone"
            binaryMessenger:[registrar messenger]];
  FlutterLocalTimezonePlugin* instance = [[FlutterLocalTimezonePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getLocalTimezone" isEqualToString:call.method]) {
    NSString* timeZone = [[NSTimeZone localTimeZone] name];
    result(timeZone);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
