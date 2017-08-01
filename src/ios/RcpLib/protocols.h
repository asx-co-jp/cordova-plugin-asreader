//  protocol0422.h
//  Created by Robin on 2016. 4. 22..

#ifndef protocol0422_h
#define protocol0422_h

#import "typeDefine.h"

/**
 *  @brief      UartMgrDelegate
 *  @details    Delegate for hardware event callback.
 */
@protocol UartMgrDelegate <NSObject>
@required

/**
 *  @brief      [ONLY SDK USE] Response of all
 *  @details    This function is called when receive data from the reader.
 *  @param      data : Data sent by the reader
 */
- (int)  receive:(NSData *)data;

/**
 *  @brief      [ONLY SDK USE] Response of connection state
 *  @details    Called when open session, close session, connected and disconnected
 *  @param      status : connected (0), disconnected (1)
 */
- (void) plugStatusChanged:(NSInteger)status;
@end


/***********************************************************************/
#pragma mark HardWare Event Delegate
/***********************************************************************/
/**
 *  @brief      HWEventDelegate
 *  @details    Delegate for hardware event callback. For example, Connect, Disconnect, Push TriggerButton... etc
 */
@protocol HWEventDelegate <NSObject>
@required



//  파워 명령에 대한 응답 (RCP 로 파워를 컨트롤 하거나 H/W Button으로 모드를 변경시 알림으로 발생됨.
/**
 *  @brief      Response of "setReaderPower".
 *  @details    It is a function that is called when the reader sends a response code to "setReaderPower"
 *  @param      isOn : On (YES), Off(NO)
 *  @param      nDeviceType : Unknown(99), Barcode(0), RFID(1), NFC(2)
 *  @param      bIsHWModeChange : YES (When mode is changed by H/W switch)
 */
- (void)resPowerOnOff:(BOOL)isOn Device:(int)nDeviceType IsHWModeChange:(BOOL)bIsHWModeChange;




@optional

/**
 *  @brief      Notification about "Power Reset" from module.
 *  @details    It is a function that is called when change the reader's connect information
 *  @param      status : Connected (OxFF), Disconnected(0x00)
 */
- (void)readerConnected:(uint8_t)status;


/**
 *  @brief      Response of trigger button on reader (Default)
 *  @details    This function is called when the trigger button of the reader is pressed or released.
 *  @param      strStatus : When device type is RFID, "RFID startScan"\n When device type is Barcode, "Barcode startScan"\n When device type is NFC, "NFC startScan"\n
 */
- (void)checkTriggerStatus:(NSString*)strStatus;


/**
 *  @brief      Response of plug state change
 *  @details    It is a function that is called when the plug state of reader and iPhone change
 *  @param      plug : plugged (YES), unplugged (NO)
 */
- (void)plugged:(BOOL)plug;



/**
 *  @brief      [Customer Mode] Response of trigger button on reader
 *  @details    This function is called when the trigger button of the reader is pressed.
 */
- (void)pushedTriggerButton;


/**
 *  @brief      [Customer Mode] Response of trigger button on reader
 *  @details    This function is called when the trigger button of the reader is released.
 */
- (void)releasedTriggerButton;
@end


/***********************************************************************/
#pragma mark Reader Common Delegate
/***********************************************************************/
/**
 *  @brief      RcpCommonDelegate
 *  @details    Delegate for reader common event callback.
 */
@protocol RcpCommonDelegate <NSObject>
@optional

 /**
 *  @brief      [Not Use] Response of undefined command
 *  @details
 *  @param      commandCode : Data (Payload)
 */
- (void)ackReceived:(uint8_t)commandCode;


/**
 *  @brief      Response of invalid command
 *  @details
 *  @param      errCode : payload(error code, command code, sub error code)
 */
- (void)errReceived:(NSData *)errCode;

/**
 *  @brief      Response of "StartAutoRead"
 *  @details    It is a function that is called when the reader sends a response code to "startReadTags"
 *  @param      status : Success (0x00)
 */
- (void)startedReadScan:(uint8_t)status;


/**
 *  @brief      Response of "StopAutoRead"
 *  @details    It is a function that is called when the reader sends a response code to "stopReadTags"
 *  @param      status : Success (0x00)
 */
- (void)stopReadScan:(uint8_t)status;

/**
 *  @brief      This function is called when receive a battery level of reader
 *  @param      data : Battery level
 */
- (void)adcReceived:(NSData*)data;

/**
 *  @brief      This function is called when receive a tag data
 *  @param      DeviceType : Data of tag read
 *  @param      nDeviceType : Unknown(99), Barcode(0), RFID(1), NFC(2)
 */
- (void)receivedScanData:(NSData *)readData DeviceType:(int)nDeviceType;

/**
 *  @brief      Response of  "Barcode Factory Reset"
 *  @details    It is a function that is called when the reader sends a response code to "Barcode Factory Reset" in Barcode type
 *  @param      status : reset start(0x00), reset complete(0xFF)
 */
- (void)resFactoryRset:(uint8_t)status;

/**
 *  @brief      It is a function that is called when receive a tag data (nfc type)
 *  @param      rawData : Data of nfc tag read
 */
- (void)nfcRawDataReceived:(NSData *)rawData;

/**
 *  @brief      It is a function that is called when receive a tag data (barcode type)
 *  @param      rawData : Data of barcode tag read
 */
- (void)barcodeRawDataReceived:(NSData *)rawData;

/**
 *  @brief      It is a function that is called when receive a tag data (rfid type)
 *  @param      rawData : Data of rfid tag read
 */
- (void)rfidRawDataReceived:(NSData *)rawData;

/**
 *  @brief      It is a function that is called when receive a tag data (all type)
 *  @param      rawData : Data of tag read
 */
- (void)allRawDataReceived:(NSData *)rawData;
@end


/***********************************************************************/
#pragma mark Only RFID  Delegate
/***********************************************************************/

/**
 *  @brief      RcpRFIDDelegate
 *  @details    Delegate for RFID event callback.
 */

@protocol RcpRFIDDelegate <NSObject>
@optional

/////////////////* READ RFID DATA */
/**
 *  @brief      It is a function that is called when receive a tag data with TID
 *  @param      epc : epc data
 *  @param      tid : tid data
 */
- (void)epcReceived:(NSData *)epc tid:(NSData *)tid;

/**
 *  @brief      It is a function that is called when receive a tag data
 *  @param      pcEpc : pcEpc data
 */
- (void)pcEpcReceived:(NSData *)pcEpc;

/**
 *  @brief      It is a function that is called when receive a tag data with rssi
 *  @param      pcEpc : pcEpc data
 *  @param      rssi : rssi data
 */
- (void)pcEpcRssiReceived:(NSData *)pcEpc rssi:(int8_t)rssi;

/**
 *  @brief      [NOT USE] It is a function that is called when receive a tag rssi
 *  @param      rssi : rssi data
 */
- (void)rssiReceived:(uint16_t)rssi;


/**
 *  @brief      Response of "Set Tx Power Level"
 *  @details    It is a function that is called when receive a response code to "Set Tx Power Level"
 *  @param      status : Success (0x00) Other : FAILE
 */
- (void)didSetOutputPowerLevel:(uint8_t)status;

/**
 *  @brief      Response of "Set current RF Channel"
 *  @details    It is a function that is called when receive a response code to "Set current RF Channel"
 *  @param      statusCode : Success (0x00)
 */
- (void)didSetChParamReceived:(uint8_t)statusCode;


/**
 *  @brief      Not used
 */
- (void)responseResion:(uint8_t)status;

/**
 *  @brief      Not used
 */
- (void)responseSetPwr:(uint8_t)status;

/**
 *  @brief      Response of "Set Anti-Collision Mode"
 *  @details    It is a function that is called when receive a response code to "Set Anti-Collision Mode"
 *  @param      status : Success (0x00)
 */
- (void)didSetAntiCol:(uint8_t)status;

/**
 *  @brief      Response of "Set Session"
 *  @details    It is a function that is called when receive a response code to "Set Session"
 *  @param      status : Success (0x00)
 */
- (void)didSetSession:(uint8_t)status;

/**
 *  @brief      Response of "Set Beep"
 *  @details    It is a function that is called when receive a response code to "Set Beep"
 *  @param      status : Success (0x00)
 */
- (void)didSetBeep:(uint8_t)status;

/**
 *  @brief      Response of "Set Stop Condition"
 *  @details    It is a function that is called when receive a response code to "Set Stop Condition"
 *  @param      status : Success (0x00)
 */
- (void)didSetStopCon:(uint8_t)status;

/**
 *  @brief      Response of "Get current RF Channel"
 *  @details    It is a function that is called when receive a response code to "Get current RF Channel"
 *  @param      channel : channel of rfid module
 *  @param      channelOffset : channel offset of rfid module
 */
- (void)channelReceived:(uint8_t)channel channelOffset:(uint8_t)channelOffset;

/**
 *  @brief      Response of "Get Anti-Collision Mode"
 *  @details    It is a function that is called when receive a response code to "Get Anti-Collision Mode"
 *  @param      mode : fixed Q(0x00), dynamic Q(0x01)
 *  @param      counter : counter Value
 */
- (void)anticolParamReceived:(uint8_t)mode Counter:(uint8_t)counter;


/**
 *  @brief      Response of "Get Modulation Mode"
 *  @details    It is a function that is called when receive a response code to "Get Modulation Mode"
 *  @param      param : 4byte (Refer to the RCP document)
 */
- (void)modulationParamReceived:(uint8_t)param;


/**
 *  @brief      Response of "Get Anti-Collision Mode"
 *  @details    It is a function that is called when receive a response code to "Get Anti-Collision Mode"
 *  @param      param : payload
 */
- (void)anticolParamReceived:(NSData *)param;



/**
 *  @brief      Response of "Get Tx Power Level"
 *  @details    It is a function that is called when receive a response code to "Get Tx Power Level"
 *  @param      power : Payload (Power 2byte, MinPower 2byte, Max Power 2byte)
 */
- (void)txPowerLevelReceived:(NSData*)power;

/**
 *  @brief      Response of "Get Region"
 *  @details    It is a function that is called when receive a response code to "Get Region"
 *  @param      param : korea(0x11), North america(0x21), US(0x22), Europe(0x31), Japan(0x41), China1(0x51), China2(0x52), Brazil(0x61)
 */
- (void)regionReceived:(uint8_t)region;

/**
 *  @brief      Response of "Get Stop Condition"
 *  @details    It is a function that is called when receive a response code to "Get Stop Condition"
 *  @param      data : Tag count(1byte), Scan time(1byte), Cycle(1tyte)
 */
- (void)stopConditionsReceived:(NSData *)data;

/**
 *  @brief      Response of "Get type C A/I Select Parameters"
 *  @details    It is a function that is called when receive a response code to "Get type C A/I Select Parameters"
 *  @param      selParam : Target(3bit), Action(3bit), Memory Bank(2bit), Pointer(32bit), length(8bit), Truncate(1bit), reserve(7bit), Mask(0~255 bit)
 */
- (void)selectParamReceived:(NSData *)selParam;

/**
 *  @brief      Response of "Get Type C A/I Query Parameters"
 *  @details    It is a function that is called when receive a response code to "Get Type C A/I Query Parameters"
 *  @param      qryParam : DR(1bit), M(2bit), TRext(1bit), Sel(2bit), Session(2bit), Target(1bit), Q(4bit)
 */
- (void)queryParamReceived:(NSData *)qryParam;

/**
 *  @brief      Response of "Set Region"
 *  @details    It is a function that is called when receive a response code to "Set Region"
 *  @param      status : Success (0x00)
 */
- (void)didSetRegion:(uint8_t)status;

/**
 *  @brief      Response of "Set FH and LBT Parameters"
 *  @details    It is a function that is called when receive a response code to "Set FH and LBT Parameters"
 */
- (void)onOffTimeChanged;

/*Hopping Table*/
/**
 *  @brief      Response of "Get FH and LBT Parameters"
 *  @details    It is a function that is called when receive a response code to "Get FH and LBT Parameters"
 *  @param      status : FH; enable(0x01 or over), disable(0x00)
 */
- (void)freqHPTableReceived:(uint8_t)status;


/**
 *  @brief      Response of "Get FH and LBT Parameters"
 *  @details    It is a function that is called when receive a response code to "Get FH and LBT Parameters"
 *  @param      fhLb : ReadTime(16bit), Idle Time(16bit), Carrier Sense Time(16bit), Target RF power level(16bit), FH(8bit), LBT(8bit), CW(8bit)
 */
- (void)fhLbtReceived:(NSData *)fhLb;

/**
 *  @brief      Response of "Get Frequency Hopping Table"
 *  @details    It is a function that is called when receive a response code to "Get Frequency Hopping Table"
 *  @param      table : Table size(8bit), Channel Number(table Size)
 */
- (void)hoppingTableReceived:(NSData *)table;

/**
 *  @brief      Response of "Set FH and LBT Parameters"
 *  @details    It is a function that is called when receive a response code to "Set FH and LBT Parameters"
 *  @param      status : Success (0x00)
 */
- (void)didSetFreqHPTable:(uint8_t)status;

/**
 *  @brief      Response of "Set FH and LBT Parameters"
 *  @details    It is a function that is called when receive a response code to "Set FH and LBT Parameters"
 *  @param      status : Success (0x00)
 */
- (void)didSetFhLbt:(uint8_t)status;

/**
 *  @brief      Response of "Set Optimum Frequency Hopping Table"
 *  @details    It is a function that is called when receive a response code to "Set Optimum Frequency Hopping Table"
 *  @param      status : Start(0x00), Finish(0x01)
 */
- (void)didSetOptiFreqHPTable:(uint8_t)status;

/**
 *  @brief      Response of "Set Frequency Hopping Mode"
 *  @details    It is a function that is called when receive a response code to "Set Frequency Hopping Mode"
 */
- (void)didSetFHmodeChanged;

/**
 *  @brief      Response of "Get Frequency Hopping Mode"
 *  @details    It is a function that is called when receive a response code to "Get Frequency Hopping Mode"
 */
- (void)resGetFHmode;



/*RF Module Version Update */

/**
 *  @brief      Response of "Get Reader Information"
 *  @details    It is a function that is called when receive a response code to "Get Reader Information"
 */
- (void)rfidModuleVersionReceived;


/**
 *  @brief      Response of "Get Reader Information"
 *  @details    It is a function that is called when receive a response code to "Get Reader Information"
 *  @param      data : Do not use.\n Stores the information(Read TIme, Idle Time, Carrier Sense Time, Target RF Power Level, LBT, FH, CW..etc) in ModelInformation class\n
 */
- (void)readerInfoReceived:(NSData *)data;

/**
 *  @brief      Response of "Get FH and LBT Parameters"
 *  @details    It is a function that is called when receive a response code to "Get FH and LBT Parameters"
 *  @param      data : Do not use.\n Stores the information(Read TIme, Idle Time, Carrier Sense Time, Target RF Power Level, LBT, FH, CW..etc) in ModelInformation class\n
 */
- (void)rfidOnOffTimeReceived:(NSData*)data;


/////////////////*RFID READ Write */

/**
 *  @brief      Response of "Write Type C Tag Data"
 *  @details    It is a function that is called when receive a response code to "Write Type C Tag Data"
 *  @param      statusCode : Success (0x00)
 */
- (void)writedReceived:(uint8_t)statusCode;

/**
 *  @brief      Response of "Get Session"
 *  @details    It is a function that is called when receive a response code to "Get Session"
 *  @param      session : S0(0x00), S1(0x01), S2(0x02), S3(0x03), Dev.mode(0xF0)
 */
- (void)sessionReceived:(uint8_t)session;

/**
 *  @brief      Response of "Read Type C Tag Data"
 *  @details    It is a function that is called when receive a response code to "Read Type C Tag Data"
 *  @param      data : Tag memory contents (variable)
 */
- (void)tagMemoryReceived:(NSData *)data;

/**
 *  @brief      Response of "Kill Type C Tag"
 *  @details    It is a function that is called when receive a response code to "Kill Type C Tag"
 *  @param      statusCode : Success (0x00)
 */
- (void)killedReceived:(uint8_t)statusCode;//Kill Tag

/**
 *  @brief      Response of "Lock Type C Tag"
 *  @details    It is a function that is called when receive a response code to "Kill Type C Tag"
 *  @param      statusCode : Success (0x00)
 */
- (void)lockedReceived:(uint8_t)statusCode;//LOCK Tag

/**
 *  @brief      Response of "Get Registry Item"
 *  @details    It is a function that is called when receive a response code to "Kill Type C Tag"
 *  @param      item : Active (8-bit), Data (Variable)
 */
- (void)registeryItemReceived:(NSData *)item;

/**
 *  @brief      Not used
 */
- (void)genericReceived:(NSData*)data;

/**
 *  @brief      [F/W Update] It is a function that is called when enter reboot
 *  @param      statusCode : Success (0x00)
 */
- (void)responseReboot:(uint8_t)status;

/**
 *  @brief      Not used
 */
- (void)resSetLeakage:(uint8_t)status;


/**
 *  @brief      Response of "Update Registry"
 *  @details    It is a function that is called when receive a response code to "Update Registry"
 *  @param      statusCode : Success (0x00)
 */
- (void)updatedRegistry:(uint8_t)statusCode;


/**
 *  @brief      [F/W Update] It is a function that is called when receive firmware update data
 *  @param      statusCode : Success (0x00)
 */
- (void)responseFWData:(NSData *)FWData;


@end

#endif
