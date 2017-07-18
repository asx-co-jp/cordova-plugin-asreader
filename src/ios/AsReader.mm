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
#import "ComboDevices.h"

typedef enum AsReaderType {
    AsReader_Barcode =0,
    AsReader_RFID,
    AsReader_Combo,
}AsReaderType;

@interface AsReader : CDVPlugin <RcpBarcodeDelegate,RcpRfidDelegate,RcpCommonDelegate,RcpRFIDDelegate,HWEventDelegate> {
  // Member variables go here.
	NSStringEncoding _encoding;
	BOOL _barcodePlugged;
	BOOL _rfidPlugged;
	RcpBarcodeApi *_barcodeRcp;
	RcpRfidApi *_rfidRcp;
	NSString *_barcodeStringListenerCallbackId;
	NSString *_barcodeDataListenerCallbackId;
	NSString *_barcodePluggedListenerCallbackId;
	NSString *_eventListenerCallbackId;
	NSString *_batteryListenerCallbackId;
	NSString *_readerReadyListenerCallbackId;
	NSString *_barcodePowerListenerCallbackId;
	
	NSString *_rfidPowerListenerCallbackId;
	NSString *_rfidStartedReadTagListenerCallbackId;
	NSString *_rfidStartedReadTagWithRssiListenerCallbackId;
	NSString *_rfidPcEpcStringListenerCallbackId;
	NSString *_rfidEpcStringListenerCallbackId;
	NSString *_rfidPcEpcDataListenerCallbackId;
	NSString *_rfidEpcDataListenerCallbackId;
	NSString *_rfidPcEpcDataWithRssiListenerCallbackId;
	NSString *_rfidEpcDataWithRssiListenerCallbackId;
	NSString *_rfidPcEpcStringWithRssiListenerCallbackId;
	NSString *_rfidEpcStringWithRssiListenerCallbackId;
	NSString *_rfidEpcDataWithTidListenerCallbackId;
	NSString *_rfidEpcStringWithTidListenerCallbackId;
	NSString *_rfidPluggedListenerCallbackId;
	NSString *_rfidRegionListenerCallbackId;
	NSString *_rfidRegionSettedListenerCallbackId;
	NSString *_rfidReaderInfoListenerCallbackId;
	NSString *_rfidSelectParamReceivedListenerCallbackId;
	NSString *_rfidSelectParamSettedListenerCallbackId;
	NSString *_rfidQueryParamReceivedListenerCallbackId;
	NSString *_rfidQueryParamSettedListenerCallbackId;
	NSString *_rfidChannelReceivedListenerCallbackId;
	NSString *_rfidChannelSettedListenerCallbackId;
	NSString *_rfidFhLbtParamListenerCallbackId;
	NSString *_rfidFhLbtSettedListenerCallbackId;
	NSString *_rfidOutputPowerLevelListenerCallbackId;
	NSString *_rfidOutputPowerLevelSettedListenerCallbackId;
	NSString *_rfidRFCwSettedListenerCallbackId;
	NSString *_rfidTagMemoryReceivedListenerCallbackId;
	NSString *_rfidFreqHoppingTableReceivedListenerCallbackId;
	NSString *_rfidHoppingTableSettedListenerCallbackId;
	NSString *_rfidTagMemoryWroteListenerCallbackId;
	NSString *_rfidTagKilledListenerCallbackId;
	NSString *_rfidTagLockedListenerCallbackId;
	NSString *_rfidRssiReceivedListenerCallbackId;
	NSString *_rfidAdcReceivedListenerCallbackId;
	NSString *_rfidRegistryUpdatedListenerCallbackId;
	NSString *_rfidStopConditionListenerCallbackId;
	NSString *_rfidStopConditionSettedListenerCallbackId;
	NSString *_rfidSessionReceivedListenerCallbackId;
	NSString *_rfidSessionSettedListenerCallbackId;
    
}
/*****************BARCODE*************************/
- (void)barcodePowerOn:(CDVInvokedUrlCommand*)command;
- (void)barcodePowerOff:(CDVInvokedUrlCommand*)command;
- (void)setBarcodePowerListener:(CDVInvokedUrlCommand*)command;
- (void)readBarcode:(CDVInvokedUrlCommand*)command;
- (void)readBarcodeContinuously:(CDVInvokedUrlCommand*)command;
- (void)stopReadBarcode:(CDVInvokedUrlCommand*)command;
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
- (void)setRfidStartedReadTagListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcStringListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcStringListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcDataListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcDataListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPcEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command;
- (void)setRfidPluggedListener:(CDVInvokedUrlCommand*)command;
- (void)notifyRegionTo:(CDVInvokedUrlCommand*)command;
- (void)setRegionAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyReaderInfoTo:(CDVInvokedUrlCommand*)command;
- (void)notifySelectParamTo:(CDVInvokedUrlCommand*)command;
- (void)setSelectParamAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyQueryParamTo:(CDVInvokedUrlCommand*)command;
- (void)setQueryParamAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyChannelTo:(CDVInvokedUrlCommand*)command;
- (void)setChannelAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyFhLbtParamTo:(CDVInvokedUrlCommand*)command;
- (void)setFhLbtAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyOuptPowerLevelTo:(CDVInvokedUrlCommand*)command;
- (void)setOutputPowerLevelAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)setRFCwAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)readTagMemoryNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyFreqHoppingTableTo:(CDVInvokedUrlCommand*)command;
- (void)setFreqHoppingTableAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)writeTagMemoryAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)killTagAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)lockTagAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyRssiTo:(CDVInvokedUrlCommand*)command;
- (void)notifyAdcTo:(CDVInvokedUrlCommand*)command;
- (void)setAnticollisionMode:(CDVInvokedUrlCommand*)command;
- (void)setAnticollisionModeAndOptions:(CDVInvokedUrlCommand*)command;
- (void)setSessionAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifySessionTo:(CDVInvokedUrlCommand*)command;
- (void)setStopConditionAndNotifyTo:(CDVInvokedUrlCommand*)command;
- (void)notifyStopConditionTo:(CDVInvokedUrlCommand*)command;

@property (strong, nonatomic,readwrite) CommonDevice *m_DeviceCommon;

@property (nonatomic, assign) AsReaderType asReaderType;

@end

@implementation AsReader
- (void)pluginInitialize
{
	_encoding = NSUTF8StringEncoding;
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	self.barcodeRcp.delegate = self;
	self.rfidRcp.delegate = self;
	
    
    self.m_DeviceCommon  = [CommonDevice sharedInstance];
    
    self.m_DeviceCommon.delegateCommon  = self;
    self.m_DeviceCommon.delegateRFID    = self;
    self.m_DeviceCommon.delegateHWEvent = self;

	
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

- (void)setBarcodePowerListener:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_barcodePowerListenerCallbackId = command.callbackId;
}

- (void)readBarcode:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

	CDVPluginResult* pluginResult = nil;
	
    if (self.asReaderType == AsReader_Barcode || self.asReaderType == AsReader_RFID) {
        if([self readBarcode]){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to start reading process."];
        }
    }else {
        if([self comboReadBarcode]){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to start reading process."];
        }
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
- (void)stopReadBarcode:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

	CDVPluginResult* pluginResult = nil;
	
	if([self stopReadBarcode]){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to stop reading process."];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	
	
}
- (void)isBarcodePlugged:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	if(_barcodePlugged){
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
	
	_barcodeStringListenerCallbackId = command.callbackId;
		
	//CDVPluginResult* pluginResult = nil;

	
	//pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
	//[pluginResult setKeepCallbackAsBool:YES];
	
	//[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}	
- (void)setBarcodeDataListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_barcodeDataListenerCallbackId = command.callbackId;
		
	//CDVPluginResult* pluginResult = nil;

	
	//pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
	//[pluginResult setKeepCallbackAsBool:YES];
	
	//[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setBarcodePluggedListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_barcodePluggedListenerCallbackId = command.callbackId;
	
}
- (void)setEventListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_eventListenerCallbackId = command.callbackId;
	
}
- (void)setBatteryListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_batteryListenerCallbackId = command.callbackId;
	
}
- (void)setReaderReadyListener:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_readerReadyListenerCallbackId = command.callbackId;
	
}
- (void)configureBarcode:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	uint8_t beepOn = 0x01;
	uint8_t vibrationOn = 0x01;
	uint8_t illuminationOn = 0x01;
	CDVPluginResult* pluginResult = nil;
	
	if(command.arguments.count >=1 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:0]]){
		NSLog(@"beepOn:%@",[[command arguments] objectAtIndex:0]);
		beepOn = 0x00;
	}
	if(command.arguments.count >=2 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:1]]){
		NSLog(@"vibrationOn:%@",[[command arguments] objectAtIndex:1]);
		vibrationOn = 0x00;
	}
	if(command.arguments.count >=3 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:2]]){
		NSLog(@"illuminationOn:%@",[[command arguments] objectAtIndex:2]);
		illuminationOn = 0x00;
	}
	if([self.barcodeRcp setBeep:beepOn setVibration:vibrationOn setIllumination:illuminationOn]){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to configure RFID reader"];
	}
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
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
 		[NSString stringWithFormat:@"%d",NSUTF8StringEncoding], @"UTF8",
 		[NSString stringWithFormat:@"%d",NSUTF16StringEncoding], @"UTF16",
 		[NSString stringWithFormat:@"%d",NSUTF16BigEndianStringEncoding], @"UTF16BigEndian",
 		[NSString stringWithFormat:@"%d",NSUTF16LittleEndianStringEncoding], @"UTF16LittleEndian",
 		[NSString stringWithFormat:@"%d",NSUTF32StringEncoding], @"UTF32String",
 		[NSString stringWithFormat:@"%d",NSUTF32BigEndianStringEncoding], @"UTF32BigEndian",
 		[NSString stringWithFormat:@"%d",NSUTF32LittleEndianStringEncoding], @"UTF32LittleEndian",
 		[NSString stringWithFormat:@"%d",NSProprietaryStringEncoding], @"Proprietary", nil];
		
	if(command.arguments.count >=1 && [encodingMap objectForKey:[[command arguments] objectAtIndex:0]]){
		_encoding = [[encodingMap objectForKey:[[command arguments] objectAtIndex:0]] intValue];
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[[command arguments] objectAtIndex:0]];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid Argument"];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}

- (void)barcodePowerOn
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

	dispatch_async(dispatch_get_main_queue(),^{
		//_statusLabel.text = @"Plugged";
        if (self.asReaderType == AsReader_Barcode || self.asReaderType == AsReader_RFID) {
            [self.barcodeRcp open];
            BOOL rtn = [self.barcodeRcp setReaderPower:YES];
            if(rtn && _barcodePowerListenerCallbackId){
                CDVPluginResult* pluginResult = nil;
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ON"];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
            }else if(!rtn && _barcodePowerListenerCallbackId){
                CDVPluginResult* pluginResult = nil;
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ONFAIL"];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
            }
        }else {
            if ([self.m_DeviceCommon open] && _barcodePowerListenerCallbackId) {
                [self.m_DeviceCommon setReaderPower:YES
                                                       buzzer:YES
                                                    vibration:YES
                                                          led:YES
                                                 illumination:YES
                                                         mode:RCP_COMBO_DEVICE_BARCODE];
                CDVPluginResult* pluginResult = nil;
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ON"];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
            }else if (![self.m_DeviceCommon open] && _barcodePowerListenerCallbackId) {
                CDVPluginResult* pluginResult = nil;
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ONFAIL"];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
            }
        }
		
	});
	
}

- (void)barcodePowerOff
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);	

	dispatch_async(dispatch_get_main_queue(),^{
		//_statusLabel.text = @"Unplugged";
        if (self.asReaderType == AsReader_Barcode || self.asReaderType == AsReader_RFID) {
            BOOL rtn = [self.barcodeRcp setReaderPower:NO];
            [self.barcodeRcp close];
            
            if(rtn && _barcodePowerListenerCallbackId){
                CDVPluginResult* pluginResult = nil;
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OFF"];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
            }else if(!rtn && _barcodePowerListenerCallbackId){
                CDVPluginResult* pluginResult = nil;
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OFFFAIL"];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
            }
        }else {
            [self.m_DeviceCommon close];
            CDVPluginResult* pluginResult = nil;
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OFF"];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePowerListenerCallbackId];
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
		
		if(_barcodeStringListenerCallbackId){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodeStringListenerCallbackId];
		}
		
		if(_barcodeDataListenerCallbackId){

			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:barcode];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodeDataListenerCallbackId];
		}
		
	});
}

- (void)pluggedBarcode:(BOOL)plug{
    self.asReaderType = AsReader_Barcode;
	_barcodePlugged = plug;
	CDVPluginResult* pluginResult = nil;
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	if(plug){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePluggedListenerCallbackId];
}

- (void)batteryChargeReceived:(int)battery{
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:battery];
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:_batteryListenerCallbackId];
}
- (void)readerConnected:(uint8_t)status{
	CDVPluginResult* pluginResult = nil;
	if(status == 0xFF){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:_readerReadyListenerCallbackId];
}	

- (BOOL)readBarcode{
	if ([self.barcodeRcp isOpened]) {
		return [self.barcodeRcp startReadBarcodes:0x00 mtime:0x00 repeatCycle:0x00];
	}
	return NO;
}

- (BOOL)comboReadBarcode {
    ComboBarcodeApi *device = [ComboBarcodeApi sharedInstance];
    return [device startScan];
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

- (void)isRfidOpened:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	if([self isRfidOpened]){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}else{
		
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}
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
- (void)startReadTags:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	[self startReadTags:0 mtime:0 repeatCycle:0];
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)startedReadTags:(uint8_t)status{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	if(status == 0x00){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidStartedReadTagListenerCallbackId];
	
}
- (void)startedReadTagsWithRssi:(uint8_t)status{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	if(status == 0x00){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidStartedReadTagWithRssiListenerCallbackId];
	
}
- (void)startReadTagsWithParams:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	uint8_t _mtnu;
	uint8_t _mtime;
	uint16_t _repeatCycle;
		
	if(command.arguments.count >=3){
		@try {
			_mtnu = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_mtime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_repeatCycle = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			
			if([self startReadTags:_mtnu mtime:_mtime repeatCycle:_repeatCycle]){
				NSLog(@"startReadTags return yes");
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
				//[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}else{
				NSLog(@"startReadTags return no");
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"NO"];
				//[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			//[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		//[pluginResult setKeepCallbackAsBool:YES];
		NSLog(@"parameter is not sufficient ");
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}


- (void)startReadTagsAndRssi:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	[self startReadTagsWithRssi:0 mtime:0 repeatCycle:0];
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startReadTagsAndRssiWithParams:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	uint8_t _mtnu;
	uint8_t _mtime;
	uint16_t _repeatCycle;
		
	if(command.arguments.count >=3){
		@try {
			_mtnu = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_mtime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_repeatCycle = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			
			if([self startReadTagsWithRssi:_mtnu mtime:_mtime repeatCycle:_repeatCycle]){
				NSLog(@"startReadTagsWithRssi return yes");
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
				//[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}else{
				NSLog(@"startReadTagsWithRssi return no");
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"NO"];
				//[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			//[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		//[pluginResult setKeepCallbackAsBool:YES];
		NSLog(@"parameter is not sufficient ");
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}

- (void)startReadTagsAndTid:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	[self startReadTagsWithTid:0 mtime:0 repeatCycle:0];
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startReadTagsAndTidWithParams:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	uint8_t _mtnu;
	uint8_t _mtime;
	uint16_t _repeatCycle;
		
	if(command.arguments.count >=3){
		@try {
			_mtnu = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_mtime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_repeatCycle = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			
			if([self startReadTagsWithTid:_mtnu mtime:_mtime repeatCycle:_repeatCycle]){
				NSLog(@"startReadTagsWithRssi return yes");
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
				//[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}else{
				NSLog(@"startReadTagsWithRssi return no");
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"NO"];
				//[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			//[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		//[pluginResult setKeepCallbackAsBool:YES];
		NSLog(@"parameter is not sufficient ");
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}

- (void)stopReadTags:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	[self stopReadTags];
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isRfidPlugged:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	CDVPluginResult* pluginResult = nil;
	if(_rfidPlugged){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)configureRfid:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	uint8_t beepOn = 0x01;
	uint8_t vibrationOn = 0x01;
	uint8_t illuminationOn = 0x01;
	CDVPluginResult* pluginResult = nil;
	
	if(command.arguments.count >=1 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:0]]){
		NSLog(@"beepOn:%@",[[command arguments] objectAtIndex:0]);
		beepOn = 0x00;
	}
	if(command.arguments.count >=2 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:1]]){
		NSLog(@"vibrationOn:%@",[[command arguments] objectAtIndex:1]);
		vibrationOn = 0x00;
	}
	if(command.arguments.count >=3 && ![@"YES" isEqualToString:[[command arguments] objectAtIndex:2]]){
		NSLog(@"illuminationOn:%@",[[command arguments] objectAtIndex:2]);
		illuminationOn = 0x00;
	}
	if([self.rfidRcp setBeep:beepOn setVibration:vibrationOn setIllumination:illuminationOn]){
		NSLog(@"configureRfid: success");
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];
	}else{
		NSLog(@"configureRfid: fail");
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to configure RFID reader"];
	}
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setRfidPowerListener:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidPowerListenerCallbackId = command.callbackId;
}

- (void)setRfidStartedReadTagListener:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidStartedReadTagListenerCallbackId = command.callbackId;
	
}

- (void)setRfidStartedReadTagWithRssiListener:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidStartedReadTagWithRssiListenerCallbackId = command.callbackId;
	
}

- (void)setRfidPcEpcStringListener:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidPcEpcStringListenerCallbackId = command.callbackId;
}

- (void)setRfidEpcStringListener:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidEpcStringListenerCallbackId = command.callbackId;
}

- (void)setRfidPcEpcDataListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidPcEpcDataListenerCallbackId = command.callbackId;
}

- (void)setRfidEpcDataListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidEpcDataListenerCallbackId = command.callbackId;
	
}

- (void)setRfidPcEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command{
	
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidPcEpcDataWithRssiListenerCallbackId = command.callbackId;

}

- (void)setRfidEpcDataWithRssiListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidEpcDataWithRssiListenerCallbackId = command.callbackId;

	
}

- (void)setRfidPcEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidPcEpcStringWithRssiListenerCallbackId = command.callbackId;

	
}

- (void)setRfidEpcStringWithRssiListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidEpcStringWithRssiListenerCallbackId = command.callbackId;

	
}

- (void)setRfidEpcDataWithTidListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidEpcDataWithTidListenerCallbackId = command.callbackId;

	
}

- (void)setRfidEpcStringWithTidListener:(CDVInvokedUrlCommand*)command{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidEpcStringWithTidListenerCallbackId = command.callbackId;

	
}
- (void)setRfidPluggedListener:(CDVInvokedUrlCommand*)command{
	
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	_rfidPluggedListenerCallbackId = command.callbackId;
}


- (void)notifyRegionTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidRegionListenerCallbackId = command.callbackId;
	[self getRegion];
}

- (void)setRegionAndNotifyTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidRegionSettedListenerCallbackId = command.callbackId;
	uint8_t region;
	
	if(command.arguments.count >=1){
		region = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
		if(![self setRegion:region]){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set region"];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"region parameter is required."];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}

- (void)notifyReaderInfoTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidReaderInfoListenerCallbackId = command.callbackId;
	uint8_t infoType;
	
	if(command.arguments.count >=1){
		infoType = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
		if(![self getReaderInfo:infoType]){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get reader info"];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"infoType parameter is required."];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)notifySelectParamTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidSelectParamReceivedListenerCallbackId = command.callbackId;
	
	if(![self getSelectParam]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get select params"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}


- (void)setSelectParamAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidSelectParamSettedListenerCallbackId = command.callbackId;
	
	uint8_t _target; 
	uint8_t _action;
	uint8_t _memoryBank;
	uint32_t _pointer;
	uint8_t _length;
	uint8_t _truncate;
	NSData *_mask;
	NSString *_hexMask;
	
	if(command.arguments.count >=7){
		@try {
			_target = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_action = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_memoryBank = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			_pointer = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:3]]intValue];
			_length = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:4]]intValue];
			_truncate = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:5]]intValue];
			_hexMask = [NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:6]];
		
			//_mask = (NSData *)[[command arguments] objectAtIndex:6];
			
			//-----test
			NSString *hexStr = nil;
			NSMutableString* tmp = [[NSMutableString alloc] init];
			unsigned char* ptr= (unsigned char*) [_mask bytes];
			for(int i = 0; i < _mask.length; i++) {
				[tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
			}
			hexStr = tmp;
			
			NSLog(@"%s,----mask---",hexStr);
			
			//*_hexMask = @"72ff63cea198b3edba8f7e0c23acc345050187a0cde5a9872cbab091ab73e553";

			_hexMask = [_hexMask stringByReplacingOccurrencesOfString:@" " withString:@""];
			NSMutableData *commandToSend= [[NSMutableData alloc] init];
			unsigned char whole_byte;
			char byte_chars[3] = {'\0','\0','\0'};
			int i;
			for (i=0; i < [_hexMask length]/2; i++) {
			    byte_chars[0] = [_hexMask characterAtIndex:i*2];
			    byte_chars[1] = [_hexMask characterAtIndex:i*2+1];
			    whole_byte = strtol(byte_chars, NULL, 16);
			    [commandToSend appendBytes:&whole_byte length:1]; 
			}
			NSLog(@"%@", commandToSend);
			_mask = commandToSend;
			///---test
			
			if(![self setSelectParam:_target action:_action memoryBank:_memoryBank pointer:_pointer length:_length truncate:_truncate mask:_mask]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set select param"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	
}


- (void)notifyQueryParamTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidQueryParamReceivedListenerCallbackId = command.callbackId;
	
	if(![self getQueryParam]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get query params"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setQueryParamAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidQueryParamSettedListenerCallbackId = command.callbackId;
	
	uint8_t _dr;
	uint8_t _m;
	uint8_t _trext;
	uint8_t _sel;
	uint8_t _session;
	uint8_t _target;
	uint8_t _q;
	
	if(command.arguments.count >=7){
		@try {
			_dr = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_m = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_trext = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			_sel = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:3]]intValue];
			_session = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:4]]intValue];
			_target = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:5]]intValue];
			_q = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:6]]intValue];
			
			if(![self setQueryParam:_dr m:_m trext:_trext sel:_sel session:_session target:_target q:_q]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set query param"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}


- (void)notifyChannelTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidChannelReceivedListenerCallbackId = command.callbackId;
	
	if(![self getChannel]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get channel"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setChannelAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidChannelSettedListenerCallbackId = command.callbackId;
	
	uint8_t _channel;
	uint8_t _offset;
	
	if(command.arguments.count >=2){
		@try {
			_channel = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_offset = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			
			if(![self setChannel:_channel channelOffset:_offset]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set channel"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}
- (void)notifyFhLbtParamTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidFhLbtParamListenerCallbackId = command.callbackId;
	
	if(![self getFhLbtParam]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get channel"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}


- (void)setFhLbtAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidFhLbtSettedListenerCallbackId = command.callbackId;
	
	uint16_t _readTime;
	uint16_t _idleTime;
	uint16_t _carrierSenseTime;
	uint16_t _rfLevel;
	uint8_t _frequencyHopping;
	uint8_t _listenBeforeTalk;
	uint8_t _continuousWave;
		
	
	if(command.arguments.count >=7){
		@try {
			_readTime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_idleTime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_carrierSenseTime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			_rfLevel = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:3]]intValue];
			_frequencyHopping = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:4]]intValue];
			_listenBeforeTalk = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:5]]intValue];
			_continuousWave = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:6]]intValue];
			
			if(![self setFhLbtParam:_readTime idleTime:_idleTime carrierSenseTime:_carrierSenseTime rfLevel:_rfLevel frequencyHopping:_frequencyHopping listenBeforeTalk:_listenBeforeTalk continuousWave:_continuousWave]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set fhlbt param"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}


- (void)notifyOuptPowerLevelTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidOutputPowerLevelListenerCallbackId = command.callbackId;
	
	if(![self getOutputPowerLevel]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get output power level"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setOutputPowerLevelAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidOutputPowerLevelSettedListenerCallbackId = command.callbackId;
	
	uint16_t _power;
	
	if(command.arguments.count >=1){
		@try {
			_power = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			
			if(![self setOutputPowerLevel:_power]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set output power level"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setRFCwAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidRFCwSettedListenerCallbackId = command.callbackId;
	
	uint8_t _on;
	
	if(command.arguments.count >=1){
		@try {
			_on = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			
			if(![self setOutputPowerLevel:_on]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set RFCw"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)readTagMemoryNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidTagMemoryReceivedListenerCallbackId = command.callbackId;
	
	uint32_t _accessPassword;
	NSData *_epc;
	uint8_t _memoryBank;
	uint16_t _startAddress;
	uint16_t _dataLength;
	
	if(command.arguments.count >=5){
		@try {
			_accessPassword = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_epc = (NSData *)[[command arguments] objectAtIndex:1];
			_memoryBank = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			_startAddress = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:3]]intValue];
			_dataLength = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:4]]intValue];
			
			if(![self readFromTagMemory:_accessPassword epc:_epc memoryBank:_memoryBank startAddress:_startAddress dataLength:_dataLength]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to read tag memory"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}


- (void)notifyFreqHoppingTableTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidFreqHoppingTableReceivedListenerCallbackId = command.callbackId;
	
	if(![self getFreqHoppingTable]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get output power level"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setFreqHoppingTableAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidHoppingTableSettedListenerCallbackId = command.callbackId;
	
	uint8_t _tableSize;
	NSData *_channels;
	
	if(command.arguments.count >=5){
		@try {
			_tableSize = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_channels = (NSData *)[[command arguments] objectAtIndex:1];
			
			if(![self setFreqHoppingTable:_tableSize channels:_channels]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set freq hopping table"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)updateRfidRegistryAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidRegistryUpdatedListenerCallbackId = command.callbackId;
	/*
	if(command.arguments.count <1){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	uint8_t _update;
	_update = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
	*/
	@try {
		
		if(![self updateRfidRegistry]){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to update rfid reader registry"];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		
	}
	@catch (NSException * e) {
		NSLog(@"Exception: %@", e);
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
	@finally {
	}
}

	
	
- (void)writeTagMemoryAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidTagMemoryWroteListenerCallbackId = command.callbackId;
	
	uint32_t _accessPassword;
	NSData *_epc;
	uint8_t _memoryBank;
	uint16_t _startAddress;
	NSData *_dataToWrite;
	
	if(command.arguments.count >=5){
		@try {
			_accessPassword = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_epc = (NSData *)[[command arguments] objectAtIndex:1];
			_memoryBank = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			_startAddress = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:3]]intValue];
			_dataToWrite = (NSData *)[[command arguments] objectAtIndex:4];
			
			if(![self writeToTagMemory:_accessPassword epc:_epc memoryBank:_memoryBank startAddress:_startAddress dataToWrite:_dataToWrite]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to write tag memory"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}


- (void)killTagAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidTagKilledListenerCallbackId = command.callbackId;
	
	uint32_t _accessPassword;
	NSData *_epc;
	
	if(command.arguments.count >=2){
		@try {
			_accessPassword = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_epc = (NSData *)[[command arguments] objectAtIndex:1];
			
			if(![self killTag:_accessPassword epc:_epc]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to kill tag"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)lockTagAndNotifyTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidTagLockedListenerCallbackId = command.callbackId;
	
	uint32_t _accessPassword;
	NSData *_epc;
	uint32_t _lockData;
	
	if(command.arguments.count >=3){
		@try {
			_accessPassword = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_epc = (NSData *)[[command arguments] objectAtIndex:1];
			_lockData = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			
			if(![self lockTagMemory:_accessPassword epc:_epc lockData:_lockData]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to lock tag"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)notifyRssiTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidRssiReceivedListenerCallbackId = command.callbackId;
	
	if(![self getRssi]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get rssi"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)notifyAdcTo:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidAdcReceivedListenerCallbackId = command.callbackId;
	
}

- (void)setAnticollisionMode:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	uint8_t _mode;
	
	if(command.arguments.count >=1){
		@try {
			_mode = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			
			if([self setAnticollision:_mode]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"anti-collision mode set successfully"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}else{
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set anti-collision mode"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}
- (void)setAnticollisionModeAndOptions:(CDVInvokedUrlCommand*)command
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	uint8_t _mode;
	uint8_t _qStart;
	uint8_t _qMax;
	uint8_t _qMin;
	
	if(command.arguments.count >=4){
		@try {
			_mode = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_qStart = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_qMax = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			_qMin = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:3]]intValue];
			
			if([self setAnticollision:_mode qStart:_qStart qMax:_qMax qMin:_qMin]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"anti-collision mode and options set successfully"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}else{
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set anti-collision mode and options"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)notifyStopConditionTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidStopConditionListenerCallbackId = command.callbackId;
	
	if(![self getStopCondition]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get stop condition"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setStopConditionAndNotifyTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidStopConditionSettedListenerCallbackId = command.callbackId;
	
	uint8_t _mtnu;
	uint8_t _mtime;
	uint16_t _repeatCycle;
		
	if(command.arguments.count >=3){
		@try {
			_mtnu = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			_mtime = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:1]]intValue];
			_repeatCycle = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:2]]intValue];
			
			if(![self setStopConditionMtnu:_mtnu setMtime:_mtime setRepeatCycle:_repeatCycle]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set stop condition"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)notifySessionTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidSessionReceivedListenerCallbackId = command.callbackId;
	
	if(![self getSession]){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to get session"];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}

- (void)setSessionAndNotifyTo:(CDVInvokedUrlCommand*)command{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	_rfidSessionSettedListenerCallbackId = command.callbackId;
	
	uint8_t _session;
		
	if(command.arguments.count >=1){
		@try {
			_session = [[NSString stringWithFormat:@"%@", [[command arguments] objectAtIndex:0]]intValue];
			
			if(![self setSession:_session]){
				CDVPluginResult* pluginResult = nil;
				pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"failed to set session"];
				[pluginResult setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
			}
			
		}
		@catch (NSException * e) {
			NSLog(@"Exception: %@", e);
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:e.reason];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		}
		@finally {
		}
		
		
	}else{
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"parameter is not sufficient "];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}
}
/********************************************************************* PRIVATE ***********************************************/

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
    self.asReaderType = AsReader_RFID;
	_rfidPlugged = plug;
	CDVPluginResult* pluginResult = nil;
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	if(plug){
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
	}else{
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
	}
	NSLog(@"_rfidPluggedListenerCallbackId:%@",_rfidPluggedListenerCallbackId);
	if(_rfidPluggedListenerCallbackId){
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPluggedListenerCallbackId];
	}
	
}
- (BOOL)isRfidOpened
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	return [self.rfidRcp isOpened];
}
- (void)rfidPowerOn
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);

	dispatch_async(dispatch_get_main_queue(),^{
		//_statusLabel.text = @"Plugged";
		[self.rfidRcp open];
		BOOL rtn = [self.rfidRcp setReaderPower:YES];
		
		if(rtn && _rfidPowerListenerCallbackId){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ON"];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPowerListenerCallbackId];
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
		
		if(rtn && _rfidPowerListenerCallbackId){
			CDVPluginResult* pluginResult = nil;
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OFF"];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPowerListenerCallbackId];
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


- (BOOL)startReadTagsWithTid:(uint8_t)mtnu mtime:(uint8_t)mtime repeatCycle:(uint16_t)repeatCycle
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	return [self.rfidRcp startReadTagsWithTid:mtnu mtime:mtime repeatCycle:repeatCycle];
}

- (BOOL)stopReadTags
{
	return [self.rfidRcp stopReadTags];
}

- (void)pcEpcReceived:(NSData*)pcEpc
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	dispatch_async(dispatch_get_main_queue(),^{
		
        if (self.asReaderType == AsReader_Barcode || self.asReaderType == AsReader_RFID) {
            CDVPluginResult* pluginResult = nil;
            if(_rfidPcEpcDataListenerCallbackId){
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:pcEpc];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPcEpcDataListenerCallbackId];
            }
                //NSString *value = [[NSString alloc]initWithData:pcEpc encoding:_encoding];
            NSString *hexStr = nil;
            NSMutableString* tmp = [[NSMutableString alloc] init];
            unsigned char* ptr= (unsigned char*) [pcEpc bytes];
            for(int i = 0; i < pcEpc.length; i++) {
                [tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
            }
            hexStr = tmp;
            
            if(_rfidPcEpcStringListenerCallbackId){
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:hexStr];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPcEpcStringListenerCallbackId];
            }
        }
	});

}

- (void)epcReceived:(NSData*)epc
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	dispatch_async(dispatch_get_main_queue(),^{
		
        if (self.asReaderType == AsReader_Barcode || self.asReaderType == AsReader_RFID) {
            CDVPluginResult* pluginResult = nil;
            
            if(_rfidEpcDataListenerCallbackId){
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:epc];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidEpcDataListenerCallbackId];
            }
            
                //NSString *value = [[NSString alloc]initWithData:epc encoding:_encoding];
            
            NSString *hexStr = nil;
            NSMutableString* tmp = [[NSMutableString alloc] init];
            unsigned char* ptr= (unsigned char*) [epc bytes];
            for(int i = 0; i < epc.length; i++) {
                [tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
            }
            hexStr = tmp;
            
            if(_rfidEpcStringListenerCallbackId){
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:hexStr];
                [pluginResult setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidEpcStringListenerCallbackId];
            }
            

        }
        
		
	});
	
}
- (void)pcEpcRssiReceived:(NSData *)pcEpc rssi:(int8_t)rssi
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	dispatch_async(dispatch_get_main_queue(),^{
		
		CDVPluginResult* pluginResult = nil;
		
		if(_rfidPcEpcDataWithRssiListenerCallbackId){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:pcEpc,@"PcEpc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPcEpcDataWithRssiListenerCallbackId];
		}
		
		//NSString *value = [[NSString alloc]initWithData:pcEpc encoding:_encoding];
		
		if(_rfidPcEpcStringWithRssiListenerCallbackId){
			NSString *hexStr = nil;
			NSMutableString* tmp = [[NSMutableString alloc] init];
			unsigned char* ptr= (unsigned char*) [pcEpc bytes];
			for(int i = 0; i < pcEpc.length; i++) {
				[tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
			}
			hexStr = tmp;
			
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:hexStr,@"PcEpc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPcEpcStringWithRssiListenerCallbackId];
		}
		
		
	});
}

- (void)epcReceived:(NSData *)epc rssi:(int8_t)rssi
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	dispatch_async(dispatch_get_main_queue(),^{
		
		CDVPluginResult* pluginResult = nil;
		
		if(_rfidEpcDataWithRssiListenerCallbackId){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:epc,@"Epc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidEpcDataWithRssiListenerCallbackId];
		}
		
		//NSString *value = [[NSString alloc]initWithData:epc encoding:_encoding];
		
		NSString *hexStr = nil;
		NSMutableString* tmp = [[NSMutableString alloc] init];
		unsigned char* ptr= (unsigned char*) [epc bytes];
		for(int i = 0; i < epc.length; i++) {
			[tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
		}
		hexStr = tmp;
		
		if(_rfidEpcStringWithRssiListenerCallbackId){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:hexStr,@"Epc",[NSString stringWithFormat:@"%d",rssi],@"Rssi",nil]];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidEpcStringWithRssiListenerCallbackId];
		}
		
		
	});
}

- (void)epcReceived:(NSData *)epc tid:(NSData*)tid{
	
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	dispatch_async(dispatch_get_main_queue(),^{
		
		CDVPluginResult* pluginResult = nil;
		
		if(_rfidEpcDataWithTidListenerCallbackId){
			NSDictionary *dic = @{@"Epc":epc,@"Tid":tid};
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidEpcDataWithTidListenerCallbackId];
		}
		
		//NSString *value = [[NSString alloc]initWithData:epc encoding:_encoding];
		
		if(_rfidEpcStringWithTidListenerCallbackId){
			NSString *hexStr = nil;
			NSMutableString* tmp = [[NSMutableString alloc] init];
			unsigned char* ptr= (unsigned char*) [epc bytes];
			for(int i = 0; i < epc.length; i++) {
				[tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
			}
			hexStr = tmp;
			
			NSString *hexStrTid = nil;
			NSMutableString* tmpTid = [[NSMutableString alloc] init];
			unsigned char* ptrTid= (unsigned char*) [tid bytes];
			for(int i = 0; i < tid.length; i++) {
				[tmpTid appendFormat:@"%02X", *ptrTid++ & 0xFF ];
			}
			hexStrTid = tmpTid;
			
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:hexStr,@"Epc",hexStrTid,@"Tid",nil]];
			[pluginResult setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidEpcStringWithTidListenerCallbackId];
		}
		
		
	});
}
- (BOOL)getRegion{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getRegion];
}
- (void)regionReceived:(uint8_t)region
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidRegionListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:region];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidRegionListenerCallbackId];
	}
}
- (BOOL)setRegion:(uint8_t)region
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setRegion:region];
}
- (void)didSetRegionReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidRegionSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidRegionSettedListenerCallbackId];
	}
}
- (BOOL)getReaderInfo:(uint8_t)infoType
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getReaderInfo:infoType];
}
- (void)readerInfoReceived:(NSData *)data
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidReaderInfoListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:data];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidReaderInfoListenerCallbackId];
	}
}
- (BOOL)getSelectParam
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getSelectParam];
}
- (void)selectParamReceived:(NSData *)selParam
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidSelectParamReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:selParam];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidSelectParamReceivedListenerCallbackId];
	}
}

- (BOOL)setSelectParam:(uint8_t)target action:(uint8_t)action memoryBank:(uint8_t)memoryBank pointer:(uint32_t)pointer length:(uint8_t)length truncate:(uint8_t)truncate mask:(NSData *)mask
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setSelectParam:target action:action memoryBank:memoryBank pointer:pointer length:length truncate:truncate mask:mask];
	
}
- (void)didSetSelParamReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidSelectParamSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidSelectParamSettedListenerCallbackId];
	}
}
- (BOOL)getQueryParam
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getSelectParam];
}
- (void)queryParamReceived:(NSData *)qryParam
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidQueryParamReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:qryParam];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidQueryParamReceivedListenerCallbackId];
	}
}

- (BOOL)setQueryParam:(uint8_t)dr
 m:(uint8_t)m
 trext:(uint8_t)trext
 sel:(uint8_t)sel
 session:(uint8_t)session
 target:(uint8_t)target
 q:(uint8_t)q
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return NO;
	//return [self.rfidRcp setQueryParam:dr m:m trext:trext sel:sel session:session target:target q:q];
	
}
- (void)setedQueryParamReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidQueryParamSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidQueryParamSettedListenerCallbackId];
	}
}

- (BOOL)getChannel
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getChannel];
}
- (void)channelReceived:(uint8_t)channel channelOffset:(uint8_t)channelOffset
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidChannelReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",channel],@"channel",[NSString stringWithFormat:@"%d",channelOffset],@"offset",nil]];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidChannelReceivedListenerCallbackId];
	}
}
- (BOOL)setChannel:(uint8_t)channel channelOffset:(uint8_t)channelOffset
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setChannel:channel channelOffset:channelOffset];
}
- (void)didSetChParamReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidChannelSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidChannelSettedListenerCallbackId];
	}
}

- (BOOL)getFhLbtParam
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getFhLbtParam];
}
- (void)fhLbtReceived:(NSData *)fhLb
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidFhLbtParamListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:fhLb];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidFhLbtParamListenerCallbackId];
	}
}

- (BOOL)setFhLbtParam:(uint16_t)readTime
idleTime:(uint16_t)idleTime
carrierSenseTime:(uint16_t) carrierSenseTime
rfLevel:(uint16_t)rfLevel
frequencyHopping:(uint8_t)frequencyHopping
listenBeforeTalk:(uint8_t)listenBeforeTalk
continuousWave:(uint8_t)continuousWave
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setFhLbtParam:readTime idleTime:idleTime carrierSenseTime:carrierSenseTime rfLevel:rfLevel frequencyHopping:frequencyHopping listenBeforeTalk:listenBeforeTalk continuousWave:continuousWave];
	
}

- (void)didSetFhLbtReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidFhLbtSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidFhLbtSettedListenerCallbackId];
	}
}
- (BOOL)getOutputPowerLevel
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getOutputPowerLevel];
}
- (void)txPowerLevelReceived:(NSData *)power
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidOutputPowerLevelListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:power];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidOutputPowerLevelListenerCallbackId];
	}
}
- (BOOL)setOutputPowerLevel:(uint16_t)power
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setOutputPowerLevel:power];
}
- (void)didSetOutputPowerLevel:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidOutputPowerLevelSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidOutputPowerLevelSettedListenerCallbackId];
	}
}
- (BOOL)setRfCw:(uint8_t)on
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return NO;
	//return [self.rfidRcp setRfCw:on];
}
- (void)setedCwReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidRFCwSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidRFCwSettedListenerCallbackId];
	}
}
- (BOOL)readFromTagMemory:(uint32_t)accessPassword
epc:(NSData*)epc
memoryBank:(uint8_t)memoryBank
startAddress:(uint16_t)startAddress
dataLength:(uint16_t)dataLength
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp readFromTagMemory:accessPassword epc:epc memoryBank:memoryBank startAddress:startAddress dataLength:dataLength];
}
- (void)tagMemoryReceived:(NSData *)data
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidTagMemoryReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:data];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidTagMemoryReceivedListenerCallbackId];
	}
}
- (BOOL)getFreqHoppingTable
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getFreqHoppingTable];
}
- (void)hoppingTableReceived:(NSData *)table
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidFreqHoppingTableReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:table];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidFreqHoppingTableReceivedListenerCallbackId];
	}
}
- (BOOL)setFreqHoppingTable:(uint8_t)tableSize channels:(NSData*)channels
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setFreqHoppingTable:tableSize channels:channels];
}
- (void)didSetHoppintTbleReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidHoppingTableSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidHoppingTableSettedListenerCallbackId];
	}
}

- (BOOL)writeToTagMemory:(uint32_t)accessPassword
epc:(NSData*)epc
memoryBank:(uint8_t)memoryBank
startAddress:(uint16_t)startAddress
dataToWrite:(NSData*)dataToWrite
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp writeToTagMemory:accessPassword epc:epc memoryBank:memoryBank startAddress:startAddress dataToWrite:dataToWrite];
}
- (void)writedReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidTagMemoryWroteListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidTagMemoryWroteListenerCallbackId];
	}
}
- (BOOL)killTag:(uint32_t)killPassword epc:(NSData*)epc
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp killTag:killPassword epc:epc];
}
- (void)killedReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidTagKilledListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidTagKilledListenerCallbackId];
	}
}
- (BOOL)lockTagMemory:(uint32_t)accessPassword epc:(NSData*)epc lockData:(uint32_t)lockData
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp lockTagMemory:accessPassword epc:epc lockData:lockData];
}
- (void)lockedReceived:(uint8_t)statusCode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidTagLockedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidTagLockedListenerCallbackId];
	}
}

- (BOOL)getRssi
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getRssi];
}
- (void)rssiReceived:(uint16_t)rssi
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidRssiReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:rssi];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidRssiReceivedListenerCallbackId];
	}
}
- (void)adcReceived:(NSData*)data
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidAdcReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:data];
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidAdcReceivedListenerCallbackId];
	}
}
- (BOOL)setAnticollision:(uint8_t)mode
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setAnticollision:mode];
}
- (BOOL)setAnticollision:(uint8_t)mode qStart:(uint8_t)qStart qMax:(uint8_t)qMax qMin:(uint8_t)qMin
{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setAnticollision:mode qStart:qStart qMax:qMax qMin:qMin];
}

- (BOOL)updateRfidRegistry{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp updateRegistry];
}

- (void)updatedRegistry:(uint8_t)statusCode{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidRegistryUpdatedListenerCallbackId){
		
		CDVPluginResult* pluginResult = nil;
		if(statusCode == 0x00){
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
		}else{
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
		}
		[pluginResult setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidRegistryUpdatedListenerCallbackId];
	}
}

-(BOOL)getStopCondition{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getStopCondition];
}

- (void)stopConditionReceived:(NSData *)data{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidStopConditionListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:data];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidStopConditionListenerCallbackId];
	}
}
-(BOOL)setStopConditionMtnu:(uint8_t)mtnu setMtime:(uint8_t)mtime setRepeatCycle:(uint16_t)repeatCycle{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setStopConditionMtnu:mtnu setMtime:mtime setRepeatCycle:repeatCycle];
}
- (void)didSetStopConditionMtnu:(uint8_t)statusCode{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	
	if(_rfidStopConditionSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidStopConditionSettedListenerCallbackId];
	}
}

- (BOOL)getSession{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp getSession];
}
- (void)sessionReceived:(uint8_t)session{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidSessionReceivedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:session];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidSessionReceivedListenerCallbackId];
	}
}
- (BOOL)setSession:(uint8_t)session{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	return [self.rfidRcp setSession:session];
}
- (void)didSetSession:(uint8_t)statusCode{
	NSLog(@"%s,called",__PRETTY_FUNCTION__);
	if(_rfidSessionSettedListenerCallbackId){
		CDVPluginResult* pluginResult = nil;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:statusCode];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidSessionSettedListenerCallbackId];
	}
}

- (void)plugged:(BOOL)plug {
    self.asReaderType = AsReader_Combo;
    _rfidPlugged = plug;
    CDVPluginResult* pluginResult = nil;
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if(plug){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
        [self.m_DeviceCommon setReaderPower:YES
                                     buzzer:YES
                                  vibration:YES
                                        led:YES
                               illumination:YES
                                       mode:RCP_COMBO_DEVICE_BARCODE];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
    NSLog(@"_barcodePluggedListenerCallbackId:%@",_barcodePluggedListenerCallbackId);
    if(_barcodePluggedListenerCallbackId){
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodePluggedListenerCallbackId];
    }
}

- (void)receivedScanData:(NSData *)readData DeviceType:(int)nDeviceType {
    dispatch_async(dispatch_get_main_queue(), ^{
        switch (nDeviceType) {
            case RCP_COMBO_DEVICE_BARCODE: {
                NSString *value = [[NSString alloc]initWithData:readData encoding:_encoding];
                    //[self addText:value];
                NSLog(@"barcode read:%@",value);
                NSLog(@"%s,called",__PRETTY_FUNCTION__);
                CDVPluginResult* pluginResult = nil;
                
                if(_barcodeStringListenerCallbackId){
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
                    [pluginResult setKeepCallbackAsBool:YES];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodeStringListenerCallbackId];
                }
                
                if(_barcodeDataListenerCallbackId){
                    
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:readData];
                    [pluginResult setKeepCallbackAsBool:YES];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:_barcodeDataListenerCallbackId];
                }
            }
                break;
            case RCP_COMBO_DEVICE_RFID: {
                CDVPluginResult* pluginResult = nil;
                
                if(_rfidPcEpcDataListenerCallbackId){
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArrayBuffer:readData];
                    [pluginResult setKeepCallbackAsBool:YES];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPcEpcDataListenerCallbackId];
                }
                
                    //NSString *value = [[NSString alloc]initWithData:pcEpc encoding:_encoding];
                NSString *hexStr = nil;
                NSMutableString* tmp = [[NSMutableString alloc] init];
                unsigned char* ptr= (unsigned char*) [readData bytes];
                for(int i = 0; i < readData.length; i++) {
                    [tmp appendFormat:@"%02X", *ptr++ & 0xFF ];
                }
                hexStr = tmp;
                
                if(_rfidPcEpcStringListenerCallbackId){
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:hexStr];
                    [pluginResult setKeepCallbackAsBool:YES];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:_rfidPcEpcStringListenerCallbackId];
                }
                
            }
                break;
            default:
                break;
        }
    });
}


@end
