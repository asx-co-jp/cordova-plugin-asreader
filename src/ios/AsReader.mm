//  Disclaimer: IMPORTANT:  This AsReader software is supplied to you by AsReader
//  Inc. ("AsReader") in consideration of your agreement to the following
//  terms, and your use, installation, modification or redistribution of
//  this AsReader software constitutes acceptance of these terms.  If you do
//  not agree with these terms, please do not use, install, modify or
//  redistribute this AsReader software.
//  
//  In consideration of your agreement to abide by the following terms, and
//  subject to these terms, AsReader grants you a personal, non-exclusive
//  license, under AsReader's copyrights in this original AsReader software (the
//  "AsReader Software"), to use, reproduce, modify and redistribute the AsReader
//  Software, with or without modifications, in source and/or binary forms;
//  provided that if you redistribute the AsReader Software in its entirety and
//  without modifications, you must retain this notice and the following
//  text and disclaimers in all such redistributions of the AsReader Software.
//  Neither the name, trademarks, service marks or logos of AsReader Inc. may
//  be used to endorse or promote products derived from the AsReader Software
//  without specific prior written permission from AsReader.  Except as
//  expressly stated in this notice, no other rights or licenses, express or
//  implied, are granted by AsReader herein, including but not limited to any
//  patent rights that may be infringed by your derivative works or by other
//  works in which the AsReader Software may be incorporated.
//  
//  The AsReader Software is provided by AsReader on an "AS IS" basis.  ASREADER
//  MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
//  THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE, REGARDING THE ASREADER SOFTWARE OR ITS USE AND
//  OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//  
//  IN NO EVENT SHALL ASREADER BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
//  OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
//  MODIFICATION AND/OR DISTRIBUTION OF THE ASREADER SOFTWARE, HOWEVER CAUSED
//  AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
//  STRICT LIABILITY OR OTHERWISE, EVEN IF ASREADER HAS BEEN ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//  
//  Copyright (C) 2015 AsReader Inc. All Rights Reserved.
//


#import <Cordova/CDV.h>
#import "RcpBarcodeApi.h"
#import "RcpRfidApi.h"
#import "PhyUtility.h"


@interface AsReader : CDVPlugin <RcpBarcodeDelegate,RcpRfidDelegate> {
  // Member variables go here.
	NSStringEncoding _encoding;
	BOOL barcodePlugged;
    BOOL rfidPlugged;
	RcpBarcodeApi *_barcodeRcp;
	RcpRfidApi *_rfidRcp;
	NSString *barcodeStringListenerCallbackId;
	NSString *barcodeDataListenerCallbackId;
	NSString *barcodePluggedListenerCallbackId;
	NSString *eventListenerCallbackId;
	NSString *batteryListenerCallbackId;
	NSString *readerReadyListenerCallbackId;
	NSString *barcodePowerListenerCallbackId;
	
	NSString *rfidPowerListenerCallbackId;
	NSString *rfidPcEpcStringListenerCallbackId;
	NSString *rfidEpcStringListenerCallbackId;
	NSString *rfidPcEpcDataListenerCallbackId;
	NSString *rfidEpcDataListenerCallbackId;
    NSString *rfidPcEpcDataWithRssiListenerCallbackId;
    NSString *rfidEpcDataWithRssiListenerCallbackId;
    NSString *rfidPcEpcStringWithRssiListenerCallbackId;
    NSString *rfidEpcStringWithRssiListenerCallbackId;
	NSString *rfidPluggedListenerCallbackId;
}
/*****************BARCODE*************************/
- (void)barcodePowerOn:(CDVInvokedUrlCommand*)command;
- (void)barcodePowerOff:(CDVInvokedUrlCommand*)command;
- (void)readBarcode:(CDVInvokedUrlCommand*)command;
- (void)readBarcodeContinuously:(CDVInvokedUrlCommand*)command;
- (void)isBarcodePlugged:(CDVInvokedUrlCommand*)command;
- (void)getSDKVersion:(CDVInvokedUrlCommand*)command;
- (void)setBarcodeStringListener:(CDVInvokedUrlCommand*)command;
- (void)setBarcodeDataListener:(CDVInvokedUrlCommand*)command;
- (void)setBarcodePluggedListener:(CDVInvokedUrlCommand*)command;
- (void)setEventListener:(CDVInvokedUrlCommand*)command;
- (void)setBatteryListener:(CDVInvokedUrlCommand*)command;
- (void)setReaderReadyListener:(CDVInvokedUrlCommand*)command;
- (void)configureBarcode:(CDVInvokedUrlCommand*)command;
- (void)setEncoding:(CDVInvokedUrlCommand*)command;

/*******************RFID****************************/
- (void)rfidPowerOn:(CDVInvokedUrlCommand*)command;
- (void)rfidPowerOff:(CDVInvokedUrlCommand*)command;
- (void)isRfidPlugged:(CDVInvokedUrlCommand*)command;
- (void)configureRfid:(CDVInvokedUrlCommand*)command;
- (void)setRfidPowerListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcStringListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcStringListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcDataListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcDataListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPluggedListener:(CDVInvokedUrlCommand*)command;
@end

@implementation AsReader
- (void)pluginInitialize
{
	_encoding = NSUTF8StringEncoding;
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	self.barcodeRcp.delegate = self;
	self.rfidRcp.delegate = self;
	
	
}
- (void)barcodePowerOn:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
    [self barcodePowerOn];
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)barcodePowerOff:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
		
	[self barcodePowerOff];
	CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	
	
}
- (void)readBarcode:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

	CDVPluginResult* pluginResult = nil;
	
	if([self readBarcode]){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to start reading process."];
	}
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	
	
}
- (void)readBarcodeContinuously:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	CDVPluginResult* pluginResult = nil;
	
	if([self readBarcodeContinuously]){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to start reading process."];
	}
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	
	
}
- (void)isBarcodePlugged:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	if(barcodePlugged){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSDKVersion:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[self.barcodeRcp getSDKVersion]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
	
- (void)setBarcodeStringListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	barcodeStringListenerCallbackId = command.callbackId;
		
    //CDVPluginResult* pluginResult = nil;

    
    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
	//[pluginResult setKeepCallbackAsBool:YES];
	
    //[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}	
- (void)setBarcodeDataListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	barcodeDataListenerCallbackId = command.callbackId;
		
    //CDVPluginResult* pluginResult = nil;

    
    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
	//[pluginResult setKeepCallbackAsBool:YES];
	
    //[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setBarcodePluggedListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	barcodePluggedListenerCallbackId = command.callbackId;
	
}
- (void)setEventListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	eventListenerCallbackId = command.callbackId;
	
}
- (void)setBatteryListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	batteryListenerCallbackId = command.callbackId;
	
}
- (void)setReaderReadyListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	readerReadyListenerCallbackId = command.callbackId;
	
}
- (void)configureBarcode:(CDVInvokedUrlCommand*)command
{
	uint8_t beepOn = 0xFF;
	uint8_t vibrationOn = 0xFF;
	uint8_t illuminationOn = 0xFF;
	
	if(command.arguments.count >=1 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:0]]){
		beepOn = 0x00;
	}
	if(command.arguments.count >=2 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:1]]){
		vibrationOn = 0x00;
	}
	if(command.arguments.count >=3 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:2]]){
		illuminationOn = 0x00;
	}
	[self.barcodeRcp setBeep:beepOn setVibration:vibrationOn setIllumination:illuminationOn];
}

- (void)setEncoding:(CDVInvokedUrlCommand*)command
{
	
	NSDictionary *encodingMap = [[NSDictionary alloc] initWithObjectsAndKeys:
	    [NSString stringWithFormat:@"%d",NSASCIIStringEncoding], @"ASCII",
	    [NSString stringWithFormat:@"%d",NSNEXTSTEPStringEncoding], @"NEXTSTEP",
	    [NSString stringWithFormat:@"%d",NSJapaneseEUCStringEncoding], @"JapaneseEUC",
 	    [NSString stringWithFormat:@"%d",NSISOLatin1StringEncoding], @"ISOLatin1",
 	    [NSString stringWithFormat:@"%d",NSSymbolStringEncoding], @"SymbolString",
 	    [NSString stringWithFormat:@"%d",NSNonLossyASCIIStringEncoding], @"NonLossyASCII",
 	    [NSString stringWithFormat:@"%d",NSShiftJISStringEncoding], @"ShiftJIS",
 	    [NSString stringWithFormat:@"%d",NSISOLatin2StringEncoding], @"ISOLatin2",
 	    [NSString stringWithFormat:@"%d",NSUnicodeStringEncoding], @"Unicode",
 	    [NSString stringWithFormat:@"%d",NSWindowsCP1251StringEncoding], @"WindowsCP1251",
 	    [NSString stringWithFormat:@"%d",NSWindowsCP1252StringEncoding], @"WindowsCP1252",
 	    [NSString stringWithFormat:@"%d",NSWindowsCP1253StringEncoding], @"WindowsCP1253",
 	    [NSString stringWithFormat:@"%d",NSWindowsCP1254StringEncoding], @"WindowsCP1254",
 	    [NSString stringWithFormat:@"%d",NSWindowsCP1250StringEncoding], @"WindowsCP1250",
 	    [NSString stringWithFormat:@"%d",NSISO2022JPStringEncoding], @"ISO2022JP",
 	    [NSString stringWithFormat:@"%d",NSMacOSRomanStringEncoding], @"MacOSRoman",
 	    [NSString stringWithFormat:@"%d",NSUTF16StringEncoding], @"UTF16",
 	    [NSString stringWithFormat:@"%d",NSUTF16BigEndianStringEncoding], @"UTF16BigEndian",
 	    [NSString stringWithFormat:@"%d",NSUTF16LittleEndianStringEncoding], @"UTF16LittleEndian",
 	    [NSString stringWithFormat:@"%d",NSUTF32StringEncoding], @"UTF32String",
 	    [NSString stringWithFormat:@"%d",NSUTF32BigEndianStringEncoding], @"UTF32BigEndian",
 	    [NSString stringWithFormat:@"%d",NSUTF32LittleEndianStringEncoding], @"UTF32LittleEndian",
 	    [NSString stringWithFormat:@"%d",NSProprietaryStringEncoding], @"Proprietary", nil];
		
	if(command.arguments.count >=1 && [encodingMap objectForKey:[[command arguments] objectAtIndex:0]]){
		_encoding = [[encodingMap objectForKey:[[command arguments] objectAtIndex:0]] intValue];
	}
	
}

- (void)barcodePowerOn
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

    dispatch_async(dispatch_get_main_queue(),^{
        //_statusLabel.text = @"Plugged";
        [self.barcodeRcp open];
        BOOL rtn = [self.barcodeRcp setReaderPower:YES];
		
		if(rtn && barcodePowerListenerCallbackId){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ON"];
			[pluginResult setKeepCallbackAsBool:YES];
		    [self.commandDelegate sendPluginResult:pluginResult callbackId:barcodePowerListenerCallbackId];
		}
		
    });
	
}

- (void)barcodePowerOff
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);    

    dispatch_async(dispatch_get_main_queue(),^{
        //_statusLabel.text = @"Unplugged";
        BOOL rtn = [self.barcodeRcp setReaderPower:NO];
        [self.barcodeRcp close];
		
		if(rtn && barcodePowerListenerCallbackId){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OFF"];
			[pluginResult setKeepCallbackAsBool:YES];
		    [self.commandDelegate sendPluginResult:pluginResult callbackId:barcodePowerListenerCallbackId];
		}
		
    });	
	
}


- (RcpBarcodeApi *)barcodeRcp{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&pred,^{
        _sharedObject = [[RcpBarcodeApi alloc] init];
        _barcodeRcp = _sharedObject;
        _barcodeRcp.delegate = self;
    });
    return _sharedObject;
}

- (void)barcodeReceived:(NSData *)barcode{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *value = [[NSString alloc]initWithData:barcode encoding:_encoding];
        //[self addText:value];
		NSLog(@"barcode read:%@",value);
		NSLog(@"%s,called",__PRETTY_FUNCTION__);
		CDVPluginResult* pluginResult = nil;
		
		if(barcodeStringListenerCallbackId){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:barcodeStringListenerCallbackId];
		}
		
		if(barcodeDataListenerCallbackId){

			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:barcode];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:barcodeDataListenerCallbackId];
		}
		
    });
}

- (void)pluggedBarcode:(BOOL)plug{
    barcodePlugged = plug;
    CDVPluginResult* pluginResult = nil;
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    if(plug){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    }else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
	
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:barcodePluggedListenerCallbackId];
}

- (void)batteryChargeReceived:(int)battery{
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:battery];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:batteryListenerCallbackId];
}
- (void)readerConnected:(uint8_t)status{
	CDVPluginResult* pluginResult = nil;
	if(status == 0xFF){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:readerReadyListenerCallbackId];
}	

- (BOOL)readBarcode{
    if ([self.barcodeRcp isOpened]) {
        return [self.barcodeRcp startReadBarcodes:0x00 mtime:0x00 repeatCycle:0x00];
    }
	return NO;
}
- (BOOL)readBarcodeContinuously{
    if ([self.barcodeRcp isOpened]) {
        return [self.barcodeRcp startReadBarcodes:0xFF mtime:0xFF repeatCycle:0xFF];
    }
	return NO;
}

- (BOOL)stopReadBarcode{
    if ([self.barcodeRcp isOpened]) {
        return [self.barcodeRcp stopReadBarcodes];
    }
	return NO;
}

/**********************************************
                 RFID
 */


/************ PUBLIC ****************/

- (void)rfidPowerOn:(CDVInvokedUrlCommand*)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    [self rfidPowerOn];
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)rfidPowerOff:(CDVInvokedUrlCommand*)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    [self rfidPowerOff];
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)isRfidPlugged:(CDVInvokedUrlCommand*)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    CDVPluginResult* pluginResult = nil;
    if(rfidPlugged){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)configureRfid:(CDVInvokedUrlCommand*)command{
    uint8_t beepOn = 0xFF;
    uint8_t vibrationOn = 0xFF;
    uint8_t illuminationOn = 0xFF;
    
    if(command.arguments.count >=1 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:0]]){
        beepOn = 0x00;
    }
    if(command.arguments.count >=2 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:1]]){
        vibrationOn = 0x00;
    }
    if(command.arguments.count >=3 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:2]]){
        illuminationOn = 0x00;
    }
    [self.rfidRcp setBeep:beepOn setVibration:vibrationOn setIllumination:illuminationOn];
}

- (void)setRfidPowerListener:(CDVInvokedUrlCommand*)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidPowerListenerCallbackId = command.callbackId;
}

- (void)setRfidPcEpcStringListener:(CDVInvokedUrlCommand*)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidPcEpcStringListenerCallbackId = command.callbackId;
}

- (void)setRfidEpcStringListener:(CDVInvokedUrlCommand*)command{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidEpcStringListenerCallbackId = command.callbackId;
}

- (void)setRfidPcEpcDataListener:(CDVInvokedUrlCommand*)command{
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidPcEpcDataListenerCallbackId = command.callbackId;
}

- (void)setRfidEpcDataListener:(CDVInvokedUrlCommand*)command{
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidEpcDataListenerCallbackId = command.callbackId;
    
}

- (void)setRfidPcEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command{
    
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidPcEpcDataWithRssiListenerCallbackId = command.callbackId;

}

- (void)setRfidEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command{
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidEpcDataWithRssiListenerCallbackId = command.callbackId;

    
}

- (void)setRfidPcEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command{
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidPcEpcStringWithRssiListenerCallbackId = command.callbackId;

    
}

- (void)setRfidEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command{
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidEpcStringWithRssiListenerCallbackId = command.callbackId;

    
}

- (void)setRfidPluggedListener:(CDVInvokedUrlCommand*)command{
    
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    rfidPluggedListenerCallbackId = command.callbackId;
}


/********** PRIVATE ************/

- (RcpRfidApi *)rfidRcp{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&pred,^{
        _sharedObject = [[RcpRfidApi alloc] init];
        _rfidRcp = _sharedObject;
        _rfidRcp.delegate = self;
    });
    return _sharedObject;
}

- (void)pluggedRfid:(BOOL)plug{
    rfidPlugged = plug;
    CDVPluginResult* pluginResult = nil;
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    if(plug){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    }else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
	NSLog(@"rfidPluggedListenerCallbackId:%s",rfidPluggedListenerCallbackId);
	if(rfidPluggedListenerCallbackId){
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPluggedListenerCallbackId];
	}
	
}

- (void)rfidPowerOn
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

    dispatch_async(dispatch_get_main_queue(),^{
        //_statusLabel.text = @"Plugged";
        [self.rfidRcp open];
        BOOL rtn = [self.rfidRcp setReaderPower:YES];
		
		if(rtn && rfidPowerListenerCallbackId){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ON"];
			[pluginResult setKeepCallbackAsBool:YES];
		    [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPowerListenerCallbackId];
		}
		
    });
	
}

- (void)rfidPowerOff
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);    

    dispatch_async(dispatch_get_main_queue(),^{
        //_statusLabel.text = @"Unplugged";
        BOOL rtn = [self.rfidRcp setReaderPower:NO];
        [self.rfidRcp close];
		
		if(rtn && rfidPowerListenerCallbackId){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OFF"];
			[pluginResult setKeepCallbackAsBool:YES];
		    [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPowerListenerCallbackId];
		}
		
    });	
	
}
- (BOOL)startReadTags:(uint8_t)mtnu mtime:(uint8_t)mtime repeatCycle:(uint16_t)repeatCycle
{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    return [self.rfidRcp startReadTags:mtnu mtime:mtime repeatCycle:repeatCycle];
}

- (BOOL)startReadTagsWithRssi:(uint8_t)mtnu mtime:(uint8_t)mtime repeatCycle:(uint16_t)repeatCycle
{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    
    return [self.rfidRcp startReadTagsWithRssi:mtnu mtime:mtime repeatCycle:repeatCycle];
}

- (BOOL)stopReadTags
{
    return [self.rfidRcp stopReadTags];
}

- (void)pcEpcReceived:(NSData*)pcEpc
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(),^{
        
        CDVPluginResult* pluginResult = nil;
        
        if(rfidPcEpcDataListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:pcEpc];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPcEpcDataListenerCallbackId];
        }
        
        //NSString *value = [[NSString alloc]initWithData:pcEpc encoding:_encoding];
		NSString *hexStr = nil;
		NSMutableString* tmp = [[NSMutableString alloc] init];
		unsigned char* ptr= (unsigned char*) [pcEpc bytes];
		for(int i = 0; i < pcEpc.length; i++) {
			[tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
		}
		hexStr = tmp;
				
        if(rfidPcEpcStringListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:hexStr];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPcEpcStringListenerCallbackId];
        }
        
        
    });

}

- (void)epcReceived:(NSData*)epc
{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(),^{
        
        CDVPluginResult* pluginResult = nil;
        
        if(rfidEpcDataListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:epc];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidEpcDataListenerCallbackId];
        }
        
        NSString *value = [[NSString alloc]initWithData:epc encoding:_encoding];
        
        if(rfidEpcStringListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidEpcStringListenerCallbackId];
        }
        
        
    });
    
}
- (void)pcEpcRssiReceived:(NSData *)pcEpc rssi:(int8_t)rssi
{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(),^{
        
        CDVPluginResult* pluginResult = nil;
        
        if(rfidPcEpcDataWithRssiListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:pcEpc,@"PcEpc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPcEpcDataWithRssiListenerCallbackId];
        }
        
        NSString *value = [[NSString alloc]initWithData:pcEpc encoding:_encoding];
        
        if(rfidPcEpcStringWithRssiListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:value,@"PcEpc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidPcEpcStringWithRssiListenerCallbackId];
        }
        
        
    });
}

- (void)epcRssiReceived:(NSData *)epc rssi:(int8_t)rssi
{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(),^{
        
        CDVPluginResult* pluginResult = nil;
        
        if(rfidEpcDataWithRssiListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:epc,@"Epc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidEpcDataWithRssiListenerCallbackId];
        }
        
        NSString *value = [[NSString alloc]initWithData:epc encoding:_encoding];
        
        if(rfidEpcStringWithRssiListenerCallbackId){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:value,@"Epc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:rfidEpcStringWithRssiListenerCallbackId];
        }
        
        
    });
}
@end
