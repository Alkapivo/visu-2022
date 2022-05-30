///@function convertByteArrayToHex(bytes)
///@description Converts an array of number between 0..255 into a string of hexadecimal representations of each number.
///@param {Integer[]} byteArray
///@return {String} hex
function convertByteArrayToHex(argument0) {
	
		var byteArray = argument0;
	
		var stringBuilder = "";
		var byteArrayLength = getArrayLength(byteArray);
		for (var index = 0; index < byteArrayLength; index++) {
			var byte = byteArray[index];
			stringBuilder += convertByteToHex(byte);
		}
	
		return stringBuilder;
	



}
