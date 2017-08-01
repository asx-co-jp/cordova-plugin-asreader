////  RFIDApi.h
////  Created by Robin on 2016. 4. 22..


#define df_ENGINEER_MODE

#import "SDeviceApi.h"

@interface ComboRFIDApi : SDeviceApi

/**
 *  @brief      ComboRFIDApi Singleton
 *  @details
 *  @return     ComboRFIDApi object
 */
+ (id)  sharedInstance;



/**
 *  @brief      [NOT USE] Set Reader Type
 *  @details    Set the type of connected reader
 *  @return     NULL
 */
- (void)setReaderType;


/**
 *  @brief      Read Tag
 *  @details    Start an automatic tag(RFID) read operation, tag IDs are sent back to user though notification packet.
 *  @param      mtnu : Maximum number of tag to read
 *  @param      mtime : Maximum elapsed time to tagging(sec)
 *  @param      repeatCycle : How many times reader perform inventory round
 *  @return     YES
 */
- (BOOL)startScan:(uint8_t)mtnu mtime:(uint8_t)mtime repeatCycle:(uint16_t)repeatCycle;


/**
 *  @brief      Stop Read Tag
 *  @details    Stop an automatic read operation
 *  @return     YES
 */
- (BOOL)stopScan;

/**
 *  @brief      Start Read Tag with RSSI
 *  @details    Start an automatic tag read operation, tag IDs with RSSI are sent back to user though notification packet.
 *  @param      mtnu : Maximum number of tag to read
 *  @param      mtime : Maximum elapsed time to tagging(sec)
 *  @param      repeatCycle : How many times reader perform inventory round
 *  @return     YES
 */
- (BOOL)startReadTagsWithRssi:(uint8_t)maxTags mtime:(uint8_t)maxTime repeatCycle:(uint16_t)repeatCycle;



/**
 *  @brief      Start Read Tag with TID
 *  @details    Start an automatic tag read operation, tag IDs with TID are sent back to user though notification packet.
 *  @param      mtnu : Maximum number of tag to read
 *  @param      mtime : Maximum elapsed time to tagging(sec)
 *  @param      repeatCycle : How many times reader perform inventory round
 *  @return     YES
 */
- (BOOL)startReadTagsWithTid:(uint8_t)mtnu mtime:(uint8_t)mtime repeatCycle:(uint16_t)repeatCycle;


/**
 *  @brief      Send the "Get type C A/I Select Parameters" command to the reader
 *  @details    Get 18000-6C air interface protocol command ‘Select’ parameters. (Target, Action, Memory Bank, Strating mask address, mask length bits, Truncate, Reserve,Mask)
 *  @return     YES
 */
- (BOOL)getSelectParam;

/**
 *  @brief      Send the "Set type C A/I Select Parameters" command to the reader
 *  @details    Set 18000-6C air interface protocol command ‘Select’ parameters.
 *  @param      target : S0(000b), S1(001b), S2(010b), S3(011b), SL(100b)
 *  @param      action : Refer to ISO18000-6C
 *  @param      memoryBank :  RFU (00b), EPC (01b), TID (10b), User (11b)
 *  @param      pointer : Starting mask address
 *  @param      length : mask length bits
 *  @param      truncate : Enable (1) and Disable (0)
 *  @param      mask : Mask value
 *  @return     YES
 */
- (BOOL)setSelectParam:(uint8_t)target
                action:(uint8_t)action
            memoryBank:(uint8_t)memoryBank
               pointer:(uint32_t)pointer
                length:(uint8_t)length
              truncate:(uint8_t)truncate
                  mask:(NSData *)mask;


/**
 *  @brief      Send the "Get current RF Channel" command to the reader
 *  @details    Get RF channel. This command is valid only for non-FH mode.
 *  @return     YES
 */
- (BOOL)getChannel;


/**
 *  @brief      Send the "Set FH and LBT Parameters" command to the reader
 *  @details    Set only ReadTime and IdleTime in FH and LBT Parameters.\n continuousWave is continuousWave 0
 *  @param      ReadTime : read time (ms unit)
 *  @param      IdleTime : tdle time (ms unit)
 *  @return     YES
 */
- (BOOL)setOnOffTimeSetOnTime:(uint16_t)ReadTime
                   setOffTeim:(uint16_t)IdleTime;


/**
 *  @brief      Send the "Set current RF Channel" command to the reader
 *  @details    Set RF channel. This command is valid only for non-FHSS mode.
 *  @param      channel : Channel number. The range of channel number depends on regional settings
 *  @param      channelOffset : Channel number offset for miller subcarrier.
 *  @return     YES
 */
- (BOOL)setChannel:(uint8_t)channel
     channelOffset:(uint8_t)channelOffset;


/**
 *  @brief      Send the "Get FH and LBT Parameters" command to the reader
 *  @details    Get FH and LBT control
 *  @return     YES
 */
- (BOOL)getFhLbtParam;

/**
 *  @brief      Send the "Set FH and LBT Parameters" command to the reader
 *  @details    Set FH and LBT Parameters
 *  @param      ReadTime : read time (ms unit)
 *  @param      IdleTime : idle time (ms unit)
 *  @param      carrierSenseTime : carrier sense time (ms unit)
 *  @param      rfLevel : Target RF power level (-dBm x 10)
 *  @param      frequencyHopping : enable (0x01 or over) / disable (0x00)
 *  @param      listenBeforeTalk : enable (0x01 or over) / disable (0x00)
 *  @param      continuousWave : enable (0x01) / disable (0x00)
 *  @return     YES
 */
- (BOOL)setFhLbtParam:(uint16_t)ReadTime
             idleTime:(uint16_t)IdleTime
     carrierSenseTime:(uint16_t) carrierSenseTime
              rfLevel:(uint16_t)rfLevel
     frequencyHopping:(uint8_t)frequencyHopping
     listenBeforeTalk:(uint8_t)listenBeforeTalk
       continuousWave:(uint8_t)continuousWave;


/**
 *  @brief      Send the "Get Tx Power Level" command to the reader
 *  @details    Get current, minimum, maximum Tx power level
 *  @return     YES
 */
- (BOOL)getOutputPowerLevel;


/**
 *  @brief      Send the "Set Tx Power Level" command to the reader
 *  @details    Set current Tx power level.
 *  @param      power : Tx Power
 *  @return     YES
 */
- (BOOL)setOutputPowerLevel:(uint16_t)power;


/**
 *  @brief      [NOT USE] It has not been implemented yet.
 *  @param      accessPassword :
 *  @param      epc :
 *  @param      memoryBank :
 *  @param      startAddress :
 *  @param      dataLength :
 *  @return     0
 */
- (BOOL)readFromTagMemoryLong:(uint32_t)accessPassword
                          epc:(NSData*)epc
                   memoryBank:(uint8_t)memoryBank
                 startAddress:(uint16_t)startAddress
                   dataLength:(uint16_t)dataLength;

/**
 *  @brief      Send the "Write Type C Tag Data" command to the reader
 *  @details    Write type C tag data.
 *  @param      accessPassword : Access Password if target memory bank was password protected. Otherwise, set AP filled to 0x00000000.
 *  @param      epc : Target tag’s EPC
 *  @param      memoryBank : Target memory bank; 0x00 Reserved, 0x01 EPC, 0x02 TID, 0x03 User
 *  @param      startAddress : Starting Address word pointer
 *  @param      dataToWrite : Data to write
 *  @return     YES
 */
- (BOOL)writeToTagMemory:(uint32_t)accessPassword
                     epc:(NSData*)epc
              memoryBank:(uint8_t)memoryBank
            startAddress:(uint16_t)startAddress
             dataToWrite:(NSData*)dataToWrite;


/**
 *  @brief      Send the "Kill Type C Tag" command to the reader
 *  @details    Kill a Tag.
 *  @param      killPassword : Kill Password. If KP filed set to 0x00000000, ‘Kill Type C Tag’ command do not work. The target tag ignores it.
 *  @param      epc : Target tag’s EPC
 *  @return     YES
 */
- (BOOL)killTag:(uint32_t)killPassword
            epc:(NSData*)epc;


/**
 *  @brief      Send the "Lock Type C Tag" command to the reader
 *  @details    Lock an indicated memory bank in the tag.
 *  @param      accessPassword : Access Password if memory bank was password protected. Otherwise, set AP filled to 0x00000000.
 *  @param      epc : Target tag’s EPC
 *  @param      lockData : Lock mask and action flags. Pad 4-bit zeros (dummy) to the left of 20-bit lock mask and associated action flags.
 *  @return     YES
 */
- (BOOL)lockTagMemory:(uint32_t)accessPassword
                  epc:(NSData*)epc
             lockData:(uint32_t)lockData;

/**
 *  @brief      Send the "Get Frequency Hopping Table" command to the reader
 *  @details    Get current frequency hopping table.
 *  @return     YES
 */
- (BOOL)getFreqHoppingTable;

/**
 *  @brief      Send the "Set Frequency Hopping Table" command to the reader
 *  @details    Set current frequency hopping table.
 *  @param      tableSize : Table Size (8-bit)
 *  @param      channels : Channel Numbers (variable)
 *  @return     YES
 */
- (BOOL)setFreqHoppingTable:(uint8_t)tableSize
                   channels:(NSData*)channels;


/**
 *  @brief      [NOT USE] Send the "Get RSSI" command to the reader
 *  @details    Get RSSI level
 *  @return     YES
 */

- (BOOL)getRssi;


/**
 *  @brief      Send the "Get Session" command to the reader
 *  @details    Get current session.
 *  @return     YES
 */
- (BOOL)getSession;

/**
 *  @brief      Send the "Set Session" command to the reader
 *  @details    Set current session.
 *  @param      session : Session (8-bit): S0(0x00), S1(0x01), S2(0x02), S3(0x03), Dev.mode(0xF0)
 *  @return     YES
 */
- (BOOL)setSession:(uint8_t)session;

/**
 *  @brief      Send the "Get Anti-Collision Mode" command to the reader
 *  @details    Get Anti-collision algorithm.
 *  @return     YES
 */
- (BOOL)getAnticollision;

/**
 *  @brief      Send the "Set Anti-Collision Mode" command to the reader
 *  @details    Set Anti-collision algorithm.
 *  @param      mode : Anti-collision Mode (8-bit): fixed Q(0x00), dynamic Q(0x01)
 *  @param      counter : change target at N-th Tx On according to inventory round result\n
 - If count = 0, change at inventory round.(default, same as the exising mode)\n
 - 1: at first Tx on time.\n
 - 2: at second Tx on time.\n
 - N: at Nth Tx on time.
 *  @return     YES
 */
- (BOOL)setAnticollision:(uint8_t)mode Counter:(uint8_t)counter;

/**
 *  @brief      Send the "Update Registry" command to the reader
 *  @details    Sets Registry Update function
 *  @return     YES
 */
- (BOOL)updateRegistry;


/**
 *  @brief  Call getFhLbtParam
 *  @details [self getFhLbtParam];
 *  @return Same getFhLbtParams
 */
- (BOOL)getRFIDOnOffTime;

/**
 *  @brief      Send the "Set Stop Condition" command to the reader.
 *  @details    Set the stop point of start-auto-read
 *  @param      mtnu : Maximum number of tag to read
 *  @param      mtime : Maximum elapsed time to tagging(sec)
 *  @param      repeatCycle : How many times reader perform inventory round
 *  @return     If the connected reader is RFID jacket type, return FALSE, otherwise, return YES.
 */
- (BOOL)setStopConditionTagNum:(Byte)mtnu Time:(Byte) mtime Recycle:(UInt16)repeatCycle;


/**
 *  @brief      Send the "Get Reader Information" command to the reader
 *  @details    Get basic information from the reader.
 *  @return     YES
 */
- (BOOL)getRFIDMoudleVersion;

/**
 *  @brief      Send the "Set FH and LBT Parameters" command to the reader
 *  @details    Set only frequencyHopping and listenBeforeTalk in FH and LBT Parameters.\n continuousWave is continuousWave 0
 *  @param      isOn : If YES, Set frequencyHopping is 2 and listenBeforeTalk is 1.\n
 : If NO, Set frequencyHopping is 1 and listenBeforeTalk is 2
 *  @return     YES
 */
- (BOOL)setHoppingOnOff:(BOOL)isOn;


/**
 *  @brief      Send the "Write Type C Tag Data" command to the reader
 *  @details    Write type C tag data.
 *  @param      epc : Target tag’s EPC
 *  @param      dataToWrite : Data to write
 *  @return     YES
 */
- (BOOL)writeToTagMemory:(NSData*)epc
        dataToWriteAscii:(NSString*)dataToWrite;




//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Funtions  for Engineer  Or  Testing Funtion
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////



#ifdef df_ENGINEER_MODE
/**
 *  @brief      Send the "Get Type C A/I Query Parameters" command to the reader
 *  @details    Get 18000-6C air interface protocol command ‘Query’ parameters.
 *  @return     YES
 */
- (BOOL)getQueryParam;

/**
 *  @brief      [NOT USE] Not yet implemented.
 *  @details
 *  @param      accessPassword :
 *  @param      epc :
 *  @param      memoryBank :
 *  @param      startAddress :
 *  @param      dataLength :
 *  @param      timeout :
 *  @return     0
 */
- (BOOL)readFromTagMemoryParam:(uint32_t)accessPassword
                           epc:(NSData*)epc
                    memoryBank:(uint8_t)memoryBank
                  startAddress:(uint16_t)startAddress
                    dataLength:(uint16_t)dataLength
                       timeout:(uint16_t)timeout;




/**
 *  @brief      [UPDATE F/W] Set Program mode
 *  @details    Enter program mode. 
 *  @return     mode :0 MCU   /  1 : RFID Module
 */
- (BOOL)setReaderProgMode:(uint8_t)mode;


/**
 *  @brief      [NOT USE] Not yet implemented.
 *  @details
 *  @param      accessPassword :
 *  @param      epc :
 *  @param      memoryBank :
 *  @param      startAddress :
 *  @param      dataToWrite :
 *  @return     0
 */
- (BOOL)writeToTagMemoryParam:(uint32_t)accessPassword
                          epc:(NSData*)epc
                   memoryBank:(uint8_t)memoryBank
                 startAddress:(uint16_t)startAddress
                  dataToWrite:(NSData*)dataToWrite
                      timeout:(uint16_t)timeout;


/**
 *  @brief      [NOT USE] Not yet implemented.
 *  @details
 *  @param      accessPassword :
 *  @param      epc :
 *  @param      memoryBank :
 *  @param      startAddress :
 *  @param      dataToWrite :
 *  @return     0
 */
- (BOOL)blockwriteToTagMemory:(uint32_t)accessPassword
                          epc:(NSData*)epc
                   memoryBank:(uint8_t)memoryBank
                 startAddress:(uint16_t)startAddress
                  dataToWrite:(NSData*)dataToWrite;


/**
 *  @brief      [NOT USE]Not yet implemented.
 *  @details
 *  @param      accessPassword :
 *  @param      epc :
 *  @param      lockData :
 *  @param      timeout :
 *  @return     0
 */

- (BOOL)lockTagMemoryParam:(uint32_t)accessPassword
                       epc:(NSData*)epc
                  lockData:(uint32_t)lockData
                   timeout:(uint16_t)timeout;

/**
 *  @brief      [NOT USE]Not yet implemented.
 *  @details
 *  @param      itemLevel :
 *  @param      iChallenge :
 *  @param      target :
 *  @return     0
 */
- (BOOL)authenticate:(boolean_t)itemLevel
          iChallenge:(NSData*)iChallenge
              target:(NSData*)target;


/**
 *  @brief      [NOT USE]Not yet implemented.
 *  @details
 *  @param      accessPassword :
 *  @param      target :
 *  @param      uFlag :
 *  @param      epc :
 *  @param      tid :
 *  @param      user :
 *  @param      range :
 *  @return     0
 */
- (BOOL)untraceable:(uint32_t)accessPassword
             target:(NSData*)target
              uFlag:(uint8_t)uFlag
                epc:(uint8_t)epc
                tid:(uint8_t)tid
               user:(uint8_t)user
              range:(uint8_t)range;

/**
 *  @brief      [NOT USE] Not yet implemented.
 *  @details
 *  @param      accessPassword :
 *  @param      target :
 *  @param      pointer :
 *  @param      count :
 *  @return     0
 */
- (BOOL)readSignature:(uint32_t)accessPassword
               target:(NSData*)target
              pointer:(uint8_t)pointer
                count:(uint8_t)count;

/**
 *  @brief      [NOT USE]Not yet implemented.
 *  @details
 *  @param      min :
 *  @param      max :
 *  @return     0
 */
- (BOOL)calGpAdc:(uint8_t)min max:(uint8_t)max;


/**
 *  @brief      [NOT USE]Not yet implemented.
 *  @details
 *  @param      mode :
 *  @param      startQ :
 *  @param      maximumQ :
 *  @param      minimumQ :
 *  @return     0
 */
- (BOOL)setAntiColMode:(uint8_t)mode
                startQ:(uint8_t)startQ
              maximumQ:(uint8_t)maximumQ
              minimumQ:(uint8_t)minimumQ;


/**
 *  @brief      Send the "Read Type C Tag Data" command to the reader
 *  @details    Read Type C tag data from specified memory bank.
 *  @param      accessPassword : Access Password if target memory bank was password protected. Otherwise, set AP filled to 0x00000000.
 *  @param      epc : Target tag’s EPC
 *  @param      memoryBank : Target memory bank; RFU (0x00), EPC (0x01), TID (0x02), User (0x03)
 *  @param      startAddress : Starting Address word pointer
 *  @param      dataLength : Data Length (Word Count)
 *  @return     YES
 */
- (BOOL)readFromTagMemory:(uint32_t)accessPassword
                      epc:(NSData*)epc
               memoryBank:(uint8_t)memoryBank
             startAddress:(uint16_t)startAddress
               dataLength:(uint16_t)dataLength;


/**
 *  @brief      Send the "Set Type C A/I Query Parameters" command to the reader
 *  @details    Set 18000-6C air interface protocol command ‘Query’ parameters.
 *  @param      dr : DR=8 (0), DR=64/3 (1)
 *  @param      m : M=1 (0), M=2 (1), M=4 (2), M=8 (3)
 *  @param      trext : No pilot tone (0), Use pilot tone (1)
 *  @param      sel : All (0 or 1), ~SL (2), SL (3)
 *  @param      session : S0 (0), S1 (1), S2 (2), S3 (3)
 *  @param      target : A (0), B (1)
 *  @param      q : 0-15; the number of slots in the round.
 *  @return     YES
 */
- (BOOL)setQueryParam:(uint8_t)dr
                    m:(uint8_t)m
                trext:(uint8_t)trext
                  sel:(uint8_t)sel
              session:(uint8_t)session
               target:(uint8_t)target
                    q:(uint8_t)q;


/**
 *  @brief      Send the "RF CW signal control" command to the reader
 *  @details    Turn the Continuous Wave (CW) signal on/off. This command packet is only valid for idle mode.
 *  @param      on : On (YES), Off(NO)
 *  @return     YES
 */
- (BOOL)setRfCw:(uint8_t)on;


/**
 *  @brief      Send the "Get Modulation Mode" command to the reader
 *  @details    Get current modulation mode. The modulation mode is combination Rx modulation type and BLF
 *  @return     YES
 */
- (BOOL)getModulation;

/**
 *  @brief      Not used
 */
- (BOOL)setModulation:(uint8_t)mode;

/**
 *  @brief      Send the "BlockErase Type C Tag Data" command to the reader
 *  @details    Block erases type C tag data.
 *  @param      accessPassword : Access Password if target memory bank was password protected. Otherwise, set AP filled to 0x00000000.
 *  @param      epc : Target tag’s EPC
 *  @param      memoryBank : Target memory bank; 0x00 RFU, 0x01 EPC, 0x02 TID, 0x03 User
 *  @param      startAddress : Starting Address word pointer
 *  @param      dataLength : Data Length (Word Count)
 *  @return     YES
 */
- (BOOL)eraseTagMemory1:(uint32_t)accessPassword
                    epc:(NSData*)epc
             memoryBank:(uint8_t)memoryBank
           startAddress:(uint16_t)startAddress
             dataLength:(uint16_t)dataLength;

/**
 *  @brief      Not used
 */
- (BOOL)genericTrasport:(uint32_t)accessPassword
                    epc:(NSData *)epc
                     ts:(uint8_t)ts
                     rm:(uint8_t)rm
                     sz:(uint8_t)sz
                     gc:(NSData *)gc;

/**
 *  @brief      Not used
 */
- (BOOL)getTemperature;

/**
 *  @brief      Not used
 */
- (BOOL)eraseRegistry:(uint8_t)erase;

/**
 *  @brief      Send the "Get Registry Item" command to the reader
 *  @details    Gets Registry items
 *  @param      registryItem : Registry Version (0x0000)\n
 : Registry Version (0x0000)\n
 : Firmware Date (0x0001)\n
 : Band (0x0002)\n
 : Tx power (0x0003)\n
 : FH/LBT (0x0004)\n
 : Anti-collision Mode (0x0005)\n
 : Modulation Mode (0x0006)\n
 : Query(Q) (0x0007)\n
 : Frequency Hopping Table (0x0008)\n
 : Tx Power Table (0x0009)\n
 *  @return     YES
 */
- (BOOL)getRegistryItem:(uint16_t)registryItem;

/**
 *  @brief      If the connected reader is RFID jacket type, send the "Set Optimum Frequency Hopping Table" command to the reader, otherwise send the "Set FH and LBT Parameters" command to the reader.
 *  @details    Set Optimum Frequency Hopping Table.\n
 When the reader’s antenna size is not large enough, you cannot use all channel of your band.
 If you read tag’s information at the channel outside antenna bandwidth, the read range will be quite decreased This command help you search good channels within your band and set optimized frequency hopping table. When you execute this command, reader find optimized channel automatically.\n
 
 *  @return     YES
 */
- (BOOL) setOptimumFrequencyHoppingTable;

/**
 *  @brief      Send the "Set Frequency Hopping Mode" command to the reader.
 *  @details    Set Frequency hopping mode.
 Normal mode use all the frequency channel of your band for frequency hopping.
 Smart hopping mode use the hopping table selected by “Set Optimum Frequency Hopping Table”.
 *  @param      mode : Frequency Hopping Mode (0: Normal Mode, 1: Smart Hopping Mode)
 *  @return     YES
 */
- (BOOL) SetFrequencyHoppingMode:(uint8_t)mode;

/**
 *  @brief      Send the "Get Frequency Hopping Mode" command to the reader. (RFID jacket type has no function of Smart hopping.)
 *  @details    Get Frequency Hopping Mode.
 Reader can set two types of Frequency hopping table: normal mode and SH (Smart hopping) mode.\n
 Reader use all frequency channel of your operation band in normal mode.
 In SH (Smart Hopping) mode, you use the specified frequency hopping table selected by “Set Optimum Frequency Hopping Table” command.
 *  @return     YES
 */
- (BOOL) GetFrequencyHoppingMode;

/**
 *  @brief      Send the "Get Stop Condition" command to the reader.
 *  @details    Get the stop point of start-auto-read
 *  @return     If the connected reader is RFID jacket type, return FALSE, otherwise, return YES.
 */
- (BOOL) getStopCondition;

/**
 *  @brief      Not used
 */
- (BOOL) setLeakageCalMode:(uint8_t)mode;


/**
 *  @brief      Send the "Set Frequency Hopping Mode" command to the reader. (RFID jacket type has no function of Smart hopping.)
 *  @details    Set Frequency hopping mode.
 Normal mode use all the frequency channel of your band for frequency hopping.
 Smart hopping mode use the hopping table selected by “Set Optimum Frequency Hopping Table”.
 *  @param      isOn : Frequency Hopping Mode (NO: Normal Mode, YES: Smart Hopping Mode)
 *  @return     YES
 */
- (BOOL) setSmartHoppingOnOff:(BOOL)isOn;
#endif

@end
