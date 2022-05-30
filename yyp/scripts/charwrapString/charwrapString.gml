///@function charwrapString(text, width, delimiter)
///@description Breake string into char wrap lines. Works only for monospace fonts
///@param {String} text
///@param {Integer} width
///@param {String} delimiter
function charwrapString(argument0, argument1, argument2) {

		var text = string(argument0);
		var width = argument1;
		var delimiter = string(argument2);
	
		var textWidth = string_width(text);
		var fontWidth = string_width("|");
		var textLength = string_length(text);
	
		var result = text;
		if (textWidth > width) {
			var lineLength = width div fontWidth;
			var breaks = floor(textLength / lineLength);
			var index = 1;
			for (var index = 1; index <= breaks; index++) {
				result = string_insert(delimiter, result, index * lineLength + (index - 1));		
			}
		}
		return result;


}
