///@function colorHashToGMColor(text)
///@description Convert string to hex value. Used for colors
///@param {String} text
///@return {GMColor} gmColor
function colorHashToGMColor(argument0) {

		var text = argument0;
		var offset = string_count("#", text) > 0 ? 1 : 0;
		var asciiDigitOffset = ord("0");
		var asciiCharOffset = ord("A");

		if ((is_real(text)) || 
			((offset == 0) && (string_length(text) < 5)) ||
			((offset == 1) && (string_length(text) < 6))) {
		   return c_white;
		}

		var color = createArray(6, asciiDigitOffset);
		for (var index = 0; index < getArrayLength(color); index++) {
			color[index] = ord(string_upper(string_char_at(text, index + offset + 1)));
			color[index] = color[index] >= asciiCharOffset ? color[index] - asciiCharOffset + 10 : color[index] - asciiDigitOffset;	
		}
	
		var red = (color[0] * 16) + color[1];
		var green = (color[2] * 16) + color[3];
		var blue = (color[4] * 16) + color[5];
		var result = make_color_rgb(red, green, blue);
		color = "";

		return result;



}
