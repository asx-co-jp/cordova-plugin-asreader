var exec = require('cordova/exec');

module.exports = {
	barcodePowerOn: function(success, error) {
	    exec(success, error, "AsReader", "barcodePowerOn", []);
	},
	setBarcodeListener: function(listener){
		exec(listener, null, "AsReader", "setBarcodeListener", []);
	},
	setBarcodePluggedListener: function(listener){
		exec(listener, null, "AsReader", "setBarcodePluggedListener", []);
	}
	
};

