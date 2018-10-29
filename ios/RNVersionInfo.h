//
//  RNVersionInfo.h
//

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

@interface RNVersionInfo : NSObject <RCTBridgeModule>

@end
