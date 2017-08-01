////  BarcodeApi.h
////  Created by Robin on 2016. 4. 22..

#import "SDeviceApi.h"

@interface ComboBarcodeApi : SDeviceApi
+ (id)  sharedInstance;

/**
 *  @brief      Barcode Start Scan
 *  @details    Start an tag(Barcode) read operation,
 *  @return     YES
 */
- (BOOL) startScan;

/**
 *  @brief      Send the "Stop Scan" command to the reader
 *  @details    Stop an read operation
 *  @return     YES
 */
- (BOOL) stopScan;

/**
 *  @brief      [NOT USE] Set Reader Type
 *  @details    Set the type of connected reader
 *  @return     NULL
 */
- (void) setReaderType;

/**
 *  @brief      Barcode module Factory reset
 *  @details    Barcode reset
 *  @return     YES
 */
- (BOOL) setFactoryReset;

/**
 *  @brief      Send the "Barcode Setting" command to the reader
 *  @details    Set illumination
 *  @param      sendData : If want illumination to turn on, sendData is value converted from String "SCNAIM2." to Byte
 : If want illumination to turn off, sendData is value converted from String "SCNAIM0." to Byte
 *  @param      nLen : Length of sendData
 *  @return     YES
 */
- (BOOL) sendComboBarcodeSettingData:(Byte*)sendData len:(int)nLen;
@end
