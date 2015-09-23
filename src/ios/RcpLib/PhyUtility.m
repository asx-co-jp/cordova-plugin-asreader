//
//  PhyUtility.m
//
//  Created by Asterisk on 13. 6. 19..
//
//

#import "PhyUtility.h"

@implementation PhyUtility

@end

@implementation NSString (NSStringHexToBytes)
-(NSData*) hexStringToBytes {
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= self.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [self substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}
@end

@implementation NSData (NSDataToHexString)
-(NSString*) bytesToHexString 
{
    NSMutableString* str = [[NSMutableString alloc] init];
    unsigned char* ptr= (unsigned char*) [self bytes];
    for(int i = 0; i < self.length; i++)
        [str appendFormat:@"%02X", *ptr++ & 0xFF ];
    
    return str;
}
@end

@implementation UIApplication (Logging)
+ (void) redirectConsoleLogToDocumentFolder:(NSString*)filename
{
    NSArray *paths
        = NSSearchPathForDirectoriesInDomains
            (NSDocumentDirectory,
             NSUserDomainMask, YES);
    
    NSString *documentsDirectory
        = [paths objectAtIndex:0];
    
    NSString *logPath
        = [documentsDirectory stringByAppendingPathComponent:filename];
    
    freopen([logPath cStringUsingEncoding:NSASCIIStringEncoding], "w",stderr);
}
@end
