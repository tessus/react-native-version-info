//
//  RNVersionInfo.m
//

#import "RNVersionInfo.h"

@implementation RNVersionInfo

RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup
{
	return YES;
}

- (NSDictionary *)constantsToExport
{
	return @{
		@"appVersion"      : [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] ?: [NSNull null],
		@"buildVersion"    : [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"] ?: [NSNull null],
		@"bundleIdentifier": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"] ?: [NSNull null]
	};
}

@end
