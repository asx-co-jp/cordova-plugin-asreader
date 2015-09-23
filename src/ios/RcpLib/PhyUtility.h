//
//  PhyUtility.h
//
//  Created by Asterisk on 13. 6. 19..
//
//

#import <Foundation/Foundation.h>

@interface PhyUtility : NSObject

@end

@interface NSString (NSStringHexToBytes)
- (NSData*) hexStringToBytes;
@end

@interface NSData (NSDataToHexString)
- (NSString*) bytesToHexString;
@end

@interface UIApplication (Logging)
+ (void) redirectConsoleLogToDocumentFolder:(NSString*)filename;
@end