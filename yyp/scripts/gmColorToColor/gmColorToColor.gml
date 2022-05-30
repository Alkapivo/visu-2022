///@function gmColorToColor(gmColor, [alpha])
///@description Parse GMColorto Color.
///@param {GMColor} gmColor
///@return {Color} color
function gmColorToColor() {
	
		var color = c_white;
		if (argument_count < 1) {
			logger("gmColorToColor must have at least 1 argument provided", LogType.ERROR);	
		} else {
			color = argument[0];	
		}
	
		var red = colour_get_red(color) / 255;
		var green = colour_get_green(color) / 255;
		var blue = colour_get_blue(color) / 255;
		var alpha = argument_count == 2 ? clamp(argument[1], 0.0, 1.0) : 1.0;
	
		return createColor(red, green, blue, alpha);


}
