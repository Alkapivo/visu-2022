///@function stringContains(targetString, subString)
///@description Wrapper for string_pos.
///@param {String} targetString
///@param {String} subString
///@return {Boolean} contains
function stringContains(argument0, argument1) {

		var targetString= argument0;
		var subString = argument1;

		var debug = string_pos(subString, targetString);
		var contains = string_pos(subString, targetString) != 0;
	
		return contains;
	



}
