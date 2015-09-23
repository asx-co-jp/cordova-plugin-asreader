/********* asreader.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "RcpBarcodeApi.h"
#import "RcpRfidApi.h"
#import "PhyUtility.h"


@interface AsReader : CDVPlugin <RcpBarcodeDelegate,RcpRfidDelegate> {
  // Member variables go here.
	BOOL plugged;
	RcpBarcodeApi *rcp;
}

- (void)powerOn:(CDVInvokedUrlCommand*)command;
@end

@implementation AsReader
- (void)pluginInitialize
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	self.rcp.delegate = self;
	
}
- (void)powerOn:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (RcpBarcodeApi *)rcp{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&pred,^{
        _sharedObject = [[RcpBarcodeApi alloc] init];
        _rcp = _sharedObject;
        _rcp.delegate = self;
    });
    return _sharedObject;
}

- (void)barcodeReceived:(NSData *)barcode{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *value = [[NSString alloc]initWithData:barcode encoding:NSShiftJISStringEncoding];
        //[self addText:value];
		NSLog(@"barcode read:%s",value);
		NSLog(@"%s,called",__PRETTY_FUNCTION__);
    });
}

- (void)pluggedBarcode:(BOOL)plug{
    plugged = plug;
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    if(plug){
        static dispatch_once_t pred = 0;
        dispatch_once(&pred,
                      ^{
//                          [UIApplication redirectConsoleLogToDocumentFolder:@"rfid_log.txt"];
                      });
        
        if([self.rcp isOpened]){
            dispatch_async(dispatch_get_main_queue(),^{
                //_statusLabel.text = @"Plugged";
                [self.rcp open];
                [self.rcp setReaderPower:YES];
            });
        }
    }else{
        dispatch_async(dispatch_get_main_queue(),^{
            //_statusLabel.text = @"Unplugged";
            [self.rcp setReaderPower:NO];
            [self.rcp close];
        });
    }
}

@end
