//
//  RcpApi.h


#import <Foundation/Foundation.h>
#import "protocols.h"


@class UartMgr;
@interface SDeviceApi : NSObject
//*******************************************************************************//
//  Common API (RFID, NFC, Barcode)
//  This funtion can use all device
//*******************************************************************************//
+ (NSString*)  getSDKVersion;

/**
 *  @brief      [NOT USE] Open the session
 *  @return     Returns YES if open succes, No if open fail.
 */
- (BOOL)open;

/**
 *  @brief      Check session is open
 *  @return     Returns YES if open, No if close
 */
- (BOOL)isOpened;


/**
 *  @brief      Make sure the session is open
 *  @return     Returns YES if open, No if close
 */
- (BOOL)isConnected;

/**
 *  @brief      [NOT USE] close the session
 */
- (void)close;

/**
 *  @brief      Get Reader's RFID Region information.
 *  @details
 *  @return     Returns NO if selected mode of reader is not RFID, YES otherwise
 */
- (BOOL)getRegion;

/**
 *  @brief      Send the "Get Reader Information" and "Get Region" command to the reader
 *  @details
 *  @return     Returns FALSE if selected mode of reader is not RFID, YES otherwise
 */
- (BOOL)getReaderInfomation;

/**
 *  @brief      Send the "Get Reader Information" command to the reader
 *  @details    Get basic information from the reader.
 *  @param      infoType : model(0x00), S/N(0x01), Manufacturer(0x02), Frequency(0x03), Tag Type(0x04)
 *  @return     Returns NO if selected mode of reader is not RFID, YES otherwise
 */
- (BOOL)getReaderInfo:(uint8_t)infoType;

/**
*  @brief      [Not USE] Get current battery
*  @details
*  @return     Returns the value of battery
*/
- (int) getCurrentBat;



/**
 *  @brief      Send the "Set Region" command to the reader
 *  @details    Set the current region. PR9200 uses individual channel table that depends on region. List of region code follows below.\n Should only be used on RFID type.
 *  @param      region : Korea(0x11), NorthAmerica(0x21), US(0x22), Europe(0x31), Japan(0x41), China1(0x51), China2(0x52), Brazil(0x61)
 *  @return     YES
 */
- (BOOL)setRegion:(uint8_t)region;

/**
 *  @brief      Send the "setting" command to the reader
 *  @details    Setting when reading the tag. Can set beep, vibration, illumination, led.
 *  @param      beepOn : On(1), Off(0)
 *  @param      vibrationOn : On(1), Off(0)
 *  @param      illuminationOn : On(1), Off(0)
 *  @param      led : On(1), Off(0)
 *  @return     YES
 */
- (BOOL)setBeep:(uint8_t)beepOn
   setVibration:(uint8_t)vibrationOn
setIllumination:(uint8_t)illuminationOn
setLED:(uint8_t)led;


/**
 *  @brief      Send the "On power" command to the reader and set reader when tagging reader
 *  @details    On power of reader and setting when reading the tag. Can set beep, vibration, illumination, led.
 *  @param      isOn : On(YES), Off(NO)
 *  @param      isBeep : On(YES), Off(NO)
 *  @param      isVib : On(YES), Off(NO)
 *  @param      isLed : On(YES), Off(NO)
 *  @param      isIllu : On(YES), Off(NO)
 *  @param      nDeviceType : type of reader
 *  @return     Returns 99 if nDeviceType is unknown, 1 if add a command to queue.
 */
- (int)setReaderPower:(BOOL)isOn
                buzzer:(BOOL)isBeep
             vibration:(BOOL)isVib
                   led:(BOOL)isLed
          illumination:(BOOL)isIllu
                  mode:(int)nDeviceType;

/**
 *  @brief      Send the "Reader Program Mode" command to the reader
 *  @details    Enter the Firmware update mode
 *  @param      mode : MPU (0), RFID Ctrl (1), RFID ISP(2)
 *  @return     YES
 */
- (BOOL)setReaderProgMode:(uint8_t)mode;


/**
 *  @brief      Send the "Set Stop Condition" command to the reader.
 *  @details    Set the stop point of start-auto-read.\n Should only be used on RFID type.
 *  @param      mtnu : Maximum number of tag to read
 *  @param      mtime : Maximum elapsed time to tagging(sec)
 *  @param      repeatCycle : How many times reader perform inventory round
 */
- (void) setTagCount:(int)mtnu setSacnTime:(int)mtime setCycle:(int)repeatCycle;


/**
 *  @brief   Common event delegate
 *  @details Commonly used regardless of the type of reader (See <RcpCommonDelegate>)
 */
@property (nonatomic, weak, setter = setDelegaCommon:) id<RcpCommonDelegate> delegateCommon;


/**
 *  @brief  RFID event delegate
 *  @details Only RFID (See <RcpRFIDDelegate>)
 */
@property (nonatomic, weak, setter = setDelegateRFID:) id<RcpRFIDDelegate> delegateRFID;


/**
 *  @brief  Hardware event delegate (See <HWEventDelegate>)
 */
@property (nonatomic, weak, setter = setDelegateHWEvent:) id<HWEventDelegate> delegateHWEvent;

@end
