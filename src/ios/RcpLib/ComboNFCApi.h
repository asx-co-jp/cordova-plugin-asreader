//  NFCApi.h
//  Created by Robin on 2016. 5. 11..

#import "SDeviceApi.h"
@interface ComboNFCApi : SDeviceApi
+ (id)  sharedInstance;

/**
 *  @brief      Send the "Send Raw Data" command to the reader
 *  @details    Send "Send Raw Data" command including "sendData"
 *  @param      sendData : Byte type data
 *  @param      nLen : Length of sendData
 *  @return     YES
 */
- (BOOL) sendRawData:(Byte*)sendData len:(int)nLen;

/**
 *  @brief      Send the "Set Inventory" command to the reader
 *  @details
 *  @param      fInventoryTime :Not use
 *  @return     YES
 *  @bug        Not use parameter
 *  @todo       Will modify.
 */
- (BOOL) setInventory:(float)fInventoryTime;

/**
 *  @brief      NFC Start Sacn
 *  @details    Start an tag(NFC) read operation, tag IDs are sent back to user though notification packet.
 *  @return     YES
 */
- (BOOL) startScan;


/**
 *  @brief      NFC Stop Scan
 *  @details    Stop an read operation
 *  @return     YES
 */
- (BOOL) stopScan;
@end
