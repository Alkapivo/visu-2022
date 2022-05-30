///@function convertStringToBoolean(text)
///@description Convert encoded string boolean to Boolean. Ex. `convertStringToBoolean("true")` will return `true`
///@param {String} text
///@return {Boolean} boolean
function convertStringToBoolean(argument0) {

		var text = string_lower(string(argument0));

		return text == "true" || text == "1";
	



}
