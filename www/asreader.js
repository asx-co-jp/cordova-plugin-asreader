var exec = require('cordova/exec');

exports.powerOn = function(arg0, success, error) {
    exec(success, error, "AsReader", "powerOn", [arg0]);
};
