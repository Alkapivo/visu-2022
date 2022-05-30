///@description gmColorToColorHash(color, [alpha]);
///@param {Integer} color
///@param {Number} [alpha]
///@return {String} text
function gmColorToColorHash() {

		var color = c_white;
		if (argument_count < 0) {
			logger("gmColorToColorHash must have at least 1 argument provided", LogType.ERROR);
		} else {
			var color = argument[0];
		}

		var hexString = "\#"
		var hexSymbols ="0123456789ABCDEF";
		var colorRed = colour_get_red(color);
		var colorGreen = colour_get_green(color);
		var colorBlue = colour_get_blue(color);
		var colorAlpha = argument_count == 2 ? round(clamp(argument[1], 0.0, 1.0) * 255) : null;
	    var colorTemp = colorRed;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	    colorTemp = colorGreen;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	    colorTemp = colorBlue;
	
	    hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
	
		if (colorAlpha != null) {
			colorTemp = colorAlpha;
			hexString += 
				string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
				string_char_at(hexSymbols, (colorTemp mod 16) + 1);
		}
		colorTemp = "";

		return hexString;



}
