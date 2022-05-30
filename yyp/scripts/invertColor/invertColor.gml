///@function invertColor(color)
///@description Return new, inverted color
///@param {Color} color
function invertColor(argument0) {

		var color = argument0;
	
		return createColor(
			1.0 - getColorRed(color),
			1.0 - getColorGreen(color),
			1.0 - getColorBlue(color),
			1.0);
	



}
