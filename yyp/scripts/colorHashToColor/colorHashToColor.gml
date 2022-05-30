///@function colorHashToColor(colorHash)
///@description Parse colorHash to Color.
///@param {String} colorHash
///@return {Color} color
function colorHashToColor(argument0) {

	#macro __colorHashToColor_asciiDigitOffset ord("0")
	#macro __colorHashToColor_asciiCharOffset ord("A")

		var text = argument0;
	
		var textLength = string_length(text);
		var hasAlpha = textLength == 9;
		var asciiDigitOffset = __colorHashToColor_asciiDigitOffset;
		var asciiCharOffset = __colorHashToColor_asciiCharOffset;
	
		if ((string_count("#", text) == 0) ||
			((textLength  != 7) && (textLength != 9))) {
			
			return createColor(1.0, 1.0, 1.0, 1.0);	
		}

		var color = createArray(hasAlpha ? 8 : 6, asciiDigitOffset);
		for (var index = 0; index < getArrayLength(color); index++) {
		
			color[index] = ord(string_upper(string_char_at(text, index + 2)));
			color[index] = color[index] >= asciiCharOffset ? color[index] - asciiCharOffset + 10 : color[index] - asciiDigitOffset;
		}
	
		var red = ((color[0] * 16) + color[1]) / 255;
		var green = ((color[2] * 16) + color[3]) / 255;
		var blue = ((color[4] * 16) + color[5]) / 255;
		var alpha = hasAlpha ? (((color[6] * 16) + color[7]) / 255) : 1.0;
		var result = createColor(red, green, blue, alpha);
	
		///@gc
		color = null;

		return result;
	



}
