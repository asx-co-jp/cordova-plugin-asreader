//  CommonDevice.h
//  Created by Robin on 2016. 5. 10..
#import "SDeviceApi.h"

@interface CommonDevice : SDeviceApi
+ (id)  sharedInstance;
//+ (void) selectedDeviceType:(int)nDeviceType;
+ (void) setTriggerModeDefault:(BOOL)isDefault;

@end
