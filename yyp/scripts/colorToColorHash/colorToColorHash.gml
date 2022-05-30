///@function colorToColorHash(color)
///@description Parse Color to colorHash String.
///@param {Color} color
///@return {String} colorHash
function colorToColorHash() {

		var color = argument[0];

		var hexString = "\#"
		var hexSymbols ="0123456789ABCDEF";
		var colorRed = round(getColorRed(color) * 255);
		var colorGreen = round(getColorGreen(color) * 255);
		var colorBlue = round(getColorBlue(color) * 255);
		var colorAlpha = round(getColorAlpha(color) * 255);
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
		colorTemp = colorAlpha;
	
		hexString += 
			string_char_at(hexSymbols, ((colorTemp - colorTemp mod 16) / 16) + 1) + 
			string_char_at(hexSymbols, (colorTemp mod 16) + 1);
		colorTemp = "";

		return hexString;
	


}
