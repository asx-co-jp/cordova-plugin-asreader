//
//  RcpApi.h
//  AreteAudio
//
//  Created by Asterisk on 2013. 3. 18..
//  Copyright (c) 2013 Asterisk. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol RcpBarcodeDelegate;

@interface RcpBarcodeApi : NSObject

- (NSString*)getSDKVersion;
- (int)getBatteryValue;
- (id)init;
- (BOOL)open;
- (BOOL)isOpened;
- (void)close;
- (BOOL)startReadBarcodes:(uint8_t)mtnu mtime:(uint8_t)mtime repeatCycle:(uint16_t)repeatCycle;
- (BOOL)stopReadBarcodes;
- (BOOL)setReaderPower:(BOOL)on;
- (void)setReaderPowerOnWithBeep:(uint8_t)beepOn
                  setVibration:(uint8_t)vibrationOn
               setIllumination:(uint8_t)illuminationOn;
- (BOOL)setBeep:(uint8_t)beepOn
        setVibration:(uint8_t)vibrationOn
        setIllumination:(uint8_t)illuminationOn;
@property (nonatomic, assign) NSInteger ProtocolType;
@property (nonatomic, assign) BOOL isConnected;
@property (atomic, retain) id<RcpBarcodeDelegate> delegate;
@property (nonatomic, strong) NSString *model;
@end

@protocol RcpBarcodeDelegate <NSObject>
@optional
- (void)readerConnected:(uint8_t)status;
- (void)pluggedBarcode:(BOOL)plug;
- (void)barcodeReceived:(NSData *)barcode;
- (void)barcodeStringReceived:(NSString *)barcode;
- (void)batteryChargeReceived:(int)battery;
- (void)startedReadBarcodes:(uint8_t)statusCode;
- (void)stoppedReadBarcodes:(uint8_t)statusCode;
- (void)errReceived:(uint8_t)errCode;
- (void)errDetailReceived:(NSData *)errCode;
@end

