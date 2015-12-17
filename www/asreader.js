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
var exec = require('cordova/exec');

module.exports = {
	/***************** BARCODE ****************/
	barcodePowerOn: function(success, error) {
		exec(success, error, "AsReader", "barcodePowerOn", []);
	},
	barcodePowerOff: function(success, error) {
		exec(success, error, "AsReader", "barcodePowerOff", []);
	},
	setBarcodePowerListener: function(listener){
		exec(listener, null, "AsReader", "setBarcodePowerListener", []);
	},
	setBarcodeStringListener: function(listener){
		exec(listener, null, "AsReader", "setBarcodeStringListener", []);
	},
	setBarcodeDataListener: function(listener){
		exec(listener, null, "AsReader", "setBarcodeDataListener", []);
	},
	setBarcodePluggedListener: function(listener){
		exec(listener, null, "AsReader", "setBarcodePluggedListener", []);
	},
	readBarcode: function(success, error){
		 exec(success, error, "AsReader", "readBarcode", []);
	},
	readBarcodeContinuously: function(success, error){
		 exec(success, error, "AsReader", "readBarcodeContinuously", []);
	},
	isBarcodePlugged: function(success, error){
		 exec(success, error, "AsReader", "isBarcodePlugged", []);
	},
	getSDKVersion: function(success, error){
		 exec(success, error, "AsReader", "getSDKVersion", []);
	},
	setEventListener: function(listener){//not used currently
		exec(listener, null, "AsReader", "setEventListener", []);
	},
	setBatteryListener: function(listener){
		exec(listener, null, "AsReader", "setBatteryListener", []);
	},
	setReaderReadyListener: function(listener){
		exec(listener, null, "AsReader", "setReaderReadyListener", []);
	},
	configureBarcode: function(success,error,beepOn,viberationOn,illuminationOn){
		exec(success, error, "AsReader", "configureBarcode", [beepOn,viberationOn,illuminationOn]);
	},
	setEncoding: function(success, error,encoding){
		 exec(success, error, "AsReader", "setEncoding", [encoding]);
	},
	/************** RFID *******************/
	isRfidOpened: function(success, error) {
		exec(success, error, "AsReader", "isRfidOpened", []);
	},
	rfidPowerOn: function(success, error) {
		exec(success, error, "AsReader", "rfidPowerOn", []);
	},
	rfidPowerOff: function(success, error) {
		exec(success, error, "AsReader", "rfidPowerOff", []);
	},
	isRfidPlugged: function(success, error){
		 exec(success, error, "AsReader", "isRfidPlugged", []);
	},
	configureRfid: function(success,error,beepOn,viberationOn,illuminationOn){
		exec(success, error, "AsReader", "configureRfid", [beepOn,viberationOn,illuminationOn]);
	},
	startReadTags: function(success, error) {
		exec(success, error, "AsReader", "startReadTags", []);
	},
	startReadTagsWithParams: function(success, error, mtnu, mtime, repeatCycle) {
		exec(success, error, "AsReader", "startReadTagsWithParams", [mtnu, mtime, repeatCycle]);
	},
	startReadTagsAndRssi: function(success, error) {
		exec(success, error, "AsReader", "startReadTagsAndRssi", []);
	},
	startReadTagsAndRssiWithParams: function(success, error, mtnu, mtime, repeatCycle) {
		exec(success, error, "AsReader", "startReadTagsAndRssiWithParams", [mtnu, mtime, repeatCycle]);
	},
	startReadTagsAndTid: function(success, error) {
		exec(success, error, "AsReader", "startReadTagsAndTid", []);
	},
	startReadTagsAndTidWithParams: function(success, error, mtnu, mtime, repeatCycle) {
		exec(success, error, "AsReader", "startReadTagsAndTidWithParams", [mtnu, mtime, repeatCycle]);
	},
	stopReadTags: function(success, error) {
		exec(success, error, "AsReader", "stopReadTags", []);
	},
	setRfidPowerListener: function(listener){
		exec(listener, null, "AsReader", "setRfidPowerListener", []);
	},
	setRfidStartedReadTagListener: function(listener){
		exec(listener, null, "AsReader", "setRfidStartedReadTagListener", []);
	},
	setRfidPcEpcStringListener: function(listener){
		exec(listener, null, "AsReader", "setRfidPcEpcStringListener", []);
	},
	setRfidEpcStringListener: function(listener){
		exec(listener, null, "AsReader", "setRfidEpcStringListener", []);
	},
	setRfidPcEpcDataListener: function(listener){
		exec(listener, null, "AsReader", "setRfidPcEpcDataListener", []);
	},
	setRfidEpcDataListener: function(listener){
		exec(listener, null, "AsReader", "setRfidEpcDataListener", []);
	},
	setRfidPcEpcDataWithRssiListener: function(listener){
		exec(listener, null, "AsReader", "setRfidPcEpcDataWithRssiListener", []);
	},
	setRfidEpcDataWithRssiListener: function(listener){
		exec(listener, null, "AsReader", "setRfidEpcDataWithRssiListener", []);
	},
	setRfidPcEpcStringWithRssiListener: function(listener){
		exec(listener, null, "AsReader", "setRfidPcEpcStringWithRssiListener", []);
	},
	setRfidEpcStringWithRssiListener: function(listener){
		exec(listener, null, "AsReader", "setRfidEpcStringWithRssiListener", []);
	},
	setRfidEpcDataWithTidListener: function(listener){
		exec(listener, null, "AsReader", "setRfidEpcDataWithTidListener", []);
	},
	setRfidEpcStringWithTidListener: function(listener){
		exec(listener, null, "AsReader", "setRfidEpcStringWithTidListener", []);
	},
	setRfidPluggedListener: function(listener){
		exec(listener, null, "AsReader", "setRfidPluggedListener", []);
	},
	notifyRegionTo: function(listener){
		exec(listener, null, "AsReader", "sendRegionTo", []);
	},
	setRegionAndNotifyTo: function(region,listener,error){
		exec(listener, error, "AsReader", "setRegionAndNotifyTo", [region]);
	},
	notifyReaderInfoTo: function(infoType,listener,error){
		exec(listener, error, "AsReader", "notifyReaderInfoTo", [infoType]);
	},
	notifySelectParamTo: function(listener,error){
		exec(listener, error, "AsReader", "notifySelectParamTo", []);
	},
	setSelectParamAndNotifyTo: function(target,action,memoryBank,pointer,length,truncate,mask,listener,error){
		exec(listener, error, "AsReader", "setSelectParamAndNotifyTo", [target,action,memoryBank,pointer,length,truncate,mask]);
	},
	notifyQueryParamTo: function(listener,error){
		exec(listener, error, "AsReader", "notifyQueryParamTo", []);
	},
	setQueryParamAndNotifyTo: function(dr,m,trext,sel,session,target,q,listener,error){
		exec(listener, error, "AsReader", "setQueryParamAndNotifyTo", [dr,m,trext,sel,session,target,q]);
	},
	notifyChannelTo: function(listener,error){
		exec(listener, error, "AsReader", "notifyChannelTo", []);
	},
	setChannelAndNotifyTo: function(channel,offset,listener,error){
		exec(listener, error, "AsReader", "setChannelAndNotifyTo", [channel,offset]);
	},
	notifyFhLbtParamTo: function(listener,error){
		exec(listener, error, "AsReader", "notifyFhLbtParamTo", []);
	},
	setFhLbtAndNotifyTo: function(readTime,idleTime,carrierSenseTime,rfLevel,frequencyHopping,listenBeforeTalk,continuousWave,listener,error){
		exec(listener, error, "AsReader", "setFhLbtAndNotifyTo", [readTime,idleTime,carrierSenseTime,rfLevel,frequencyHopping,listenBeforeTalk,continuousWave]);
	},
	notifyOuptPowerLevelTo: function(listener,error){
		exec(listener, error, "AsReader", "notifyOuptPowerLevelTo", []);
	},
	setOutputPowerLevelAndNotifyTo: function(power,listener,error){
		exec(listener, error, "AsReader", "setOutputPowerLevelAndNotifyTo", [power]);
	},
	setRFCwAndNotifyTo: function(on,listener,error){
		exec(listener, error, "AsReader", "setRFCwAndNotifyTo", [on]);
	},
	readTagMemoryNotifyTo: function(accessPassword,epc,memoryBank,startAddress,dataLength,listener,error){
		exec(listener, error, "AsReader", "readTagMemoryNotifyTo", [accessPassword,epc,memoryBank,startAddress,dataLength]);
	},
	notifyFreqHoppingTableTo: function(listener,error){
		exec(listener, error, "AsReader", "notifyFreqHoppingTableTo", []);
	},
	setFreqHoppingTableAndNotifyTo: function(tableSize,channels,listener,error){
		exec(listener, error, "AsReader", "setFreqHoppingTableAndNotifyTo", [tableSize,channels]);
	},
	writeTagMemoryAndNotifyTo: function(accessPassword,epc,memoryBank,startAddress,dataToWrite,listener,error){
		exec(listener, error, "AsReader", "writeTagMemoryAndNotifyTo", [accessPassword,epc,memoryBank,startAddress,dataToWrite]);
	},
	killTagAndNotifyTo: function(accessPassword,epc,listener,error){
		exec(listener, error, "AsReader", "killTagAndNotifyTo", [accessPassword,epc]);
	},
	lockTagAndNotifyTo: function(accessPassword,epc,lockData,listener,error){
		exec(listener, error, "AsReader", "lockTagAndNotifyTo", [accessPassword,epc,lockData]);
	},
	notifyRssiTo: function(listener,error){
		exec(listener, error, "AsReader", "notifyRssiTo", []);
	},
	setAnticollisionMode: function(mode,listener,error){
		exec(listener, error, "AsReader", "setAnticollisionMode", [mode]);
	},
	setAnticollisionModeAndOptions: function(mode,qStart,qMax,qMin,listener,error){
		exec(listener, error, "AsReader", "setAnticollisionModeAndOptions", [mode,qStart,qMax,qMin]);
	}
	
};

