///@function capitalToLowerCase(text)
///@description Convert string first letter to lower case
///@param {String} text
///@return {String} convertedText
function capitalToLowerCase(argument0) {

		var text = argument0;
		var capital = string_lower(string_char_at(text, 1));
		text = string_delete(text, 1, 1);
		var result = capital + text;
		return result;


}
