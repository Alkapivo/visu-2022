///@function convertByteToHex(byte)
///@description Converts a number in range 0..255 into a hexadecimal representation.
///@param {Integer} byte The number to convert.
///@return {String} The hexadecimal representation.
function convertByteToHex(argument0) {

		var byte = argument0;
	
		// TODO to global dictionary
		var dictionary = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" ];
	
		return dictionary[byte & 0xF] + dictionary[(byte & 0xF0) >> 4];
	



}
