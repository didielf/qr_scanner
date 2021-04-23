#import "FlutterQrPlugin.h"
#import "qr_scanner/qr_scanner-Swift.h"
@implementation FlutterQrPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftFlutterQrPlugin registerWithRegistrar:registrar];
}
@end
