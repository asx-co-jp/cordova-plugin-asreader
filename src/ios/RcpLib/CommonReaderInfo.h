//  CommonReaderInfo.h
//  Created by Robin on 2016. 6. 27..

#import <Foundation/Foundation.h>

@interface CommonReaderInfo : NSObject
+ (id)  sharedInstance;

/*Reader Infomation*/
@property(nonatomic,readonly) NSString *strName;
@property(nonatomic,readonly) NSString *strfirmware;
@property(nonatomic,readonly) NSString *strhardware;
@property(nonatomic,readonly) NSString *strID;
@property(nonatomic,readonly) NSString *strmanufacturer;
@property(nonatomic,readonly) NSString *strmodelNumber;
@property(nonatomic,readonly) NSString *strserialNumber;
@property(nonatomic,readonly) NSString *strProtocol;
@property(readonly,assign) int m_nReaderType;
@property(readonly,assign) int m_nCurrentSelectDevice;

@property(readonly,assign) BOOL bCanUseRFID;
@property(readonly,assign) BOOL bCanUseBarcode;
@property(readonly,assign) BOOL bCanUseNFC;
@property(readonly,assign) BOOL bIsPowerOn;



/*Common  Setting */
@property(readonly,assign) BOOL bBeep;
@property(readonly,assign) BOOL bVirbration;
@property(readonly,assign) BOOL bLED;
@property(readonly,assign) BOOL bIllumination;
/*TriggerButtonProperty*/
@property(readonly,assign) BOOL bIsTriggerModeDefault;


/*RFID Settings */
@property(readonly,assign) float fRFIDpower;
@property(readonly,assign) float fRFIDpowerMax;
@property(readonly,assign) float fRFIDpowerMin;
@property(readonly,assign) int   nRFIDonTime;
@property(readonly,assign) int   nRFIDoffTime;
@property(readonly,assign) int   nRFIDchannel;
@property(readonly,assign) int   nCount;
@property(readonly,assign) int   nScanTime;
@property(readonly,assign) int   nCycle;
@property(readonly,assign) int   nCst;
@property(readonly,assign) int   nRfl;
@property(readonly,assign) int   nLbt;
@property(readonly,assign) int   nFh;
@property(readonly,assign) int   nCw;
@property(readonly,assign) BOOL bSmartHopping;

@property(nonatomic,readonly) NSString *strRegion;
@property(nonatomic,readonly) NSString *strRFIDModuleVersion;






@end
