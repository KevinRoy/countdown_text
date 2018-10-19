#import "CountdownTextPlugin.h"
#import <countdown_text/countdown_text-Swift.h>

@implementation CountdownTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCountdownTextPlugin registerWithRegistrar:registrar];
}
@end
