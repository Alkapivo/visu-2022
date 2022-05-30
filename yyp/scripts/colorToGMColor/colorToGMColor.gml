///@function colorToGMColor(color)
///@description Returns GMColor (integer).
///@param {Color} color
///@return {GMColor} gmColor
function colorToGMColor(argument0) {

		var color = argument0;
		var gmColor = make_color_rgb(
			round(getColorRed(color) * 255),
			round(getColorGreen(color) * 255),
			round(getColorBlue(color) * 255));
		
		return gmColor;


}
