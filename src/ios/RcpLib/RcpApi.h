//
//  RcpApi.h
#import <Foundation/Foundation.h>
#import "protocols.h"
@interface RcpApi : NSObject <UartMgrDelegate>
+ (id)        sharedInstance;
@property (atomic, retain) id<RcpCommonDelegate> delegateCommon;
@property (atomic, retain) id<RcpRFIDDelegate> delegateRFID;
@property (atomic, retain) id<HWEventDelegate> delegateHWEvent;
-(void) setJacketBarcodeConnecteMessage:(uint8_t)status;
@end




