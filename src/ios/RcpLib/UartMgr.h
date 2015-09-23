//
//  Created by Asterisk on 2013. 3. 18.
//  Copyright (c) 2013 Asterisk. All rights reserved.
//
#import "Eas.h"
#import <Foundation/Foundation.h>

extern NSString* const PROTOCOL_BARCODE;
extern NSString* const PROTOCOL_RFID;
extern NSString* const PROTOCOL_DONGLE_RFID;
extern NSString* const PROTOCOL_DONGLE_BARCODE;

@protocol UartMgrBarcodeDelegate;
@protocol UartMgrRfidDelegate;

@interface UartMgr : Eas
+ (UartMgr*)sharedInstance;
- (id)initBarcode;
- (id)initRfid;
- (BOOL)openBarcode;
- (BOOL)openRfid;
- (BOOL)isBarcodeOpened;
- (BOOL)isRfidOpened;
- (void)closeBarcode;
- (void)closeRfid;
- (BOOL)send:(NSData*)data;
- (BOOL)isJacket;
@property (nonatomic, weak) id<UartMgrBarcodeDelegate> barcodeDelegate;
@property (nonatomic, weak) id<UartMgrRfidDelegate> rfidDelegate;
@end

@protocol UartMgrBarcodeDelegate <NSObject>
@required
- (int)receive:(NSData *)data;
- (void)plugStatusChanged:(NSInteger)status;
@end

@protocol UartMgrRfidDelegate <NSObject>
@required
- (int)receive:(NSData *)data;
- (void)plugStatusChanged:(NSInteger)status;
@end