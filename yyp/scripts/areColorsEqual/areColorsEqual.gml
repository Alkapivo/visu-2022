///@function areColorsEqual(sourceColor, targetColor)
///@description Compare colors if they are equal
///@param {Color} sourceColor
///@param {Color} targetColor
///@return {Boolean} areEqual
function areColorsEqual(argument0, argument1) {

		var sourceColor = argument0;
		var targetColor = argument1;
	
		var redSource = (round(255 * getColorRed(sourceColor)));
		var greenSource = (round(255 * getColorGreen(sourceColor)));
		var blueSource = (round(255 * getColorBlue(sourceColor)));
		var alphaSource = (round(255 * getColorAlpha(sourceColor)));
	
		var redTarget = (round(255 * getColorRed(targetColor)));
		var greenTarget = (round(255 * getColorGreen(targetColor)));
		var blueTarget = (round(255 * getColorBlue(targetColor)));
		var alphaTarget = (round(255 * getColorAlpha(targetColor)));
	
		var areEqual = (
			(redSource == redTarget) &&
			(greenSource == greenTarget) &&
			(blueSource == blueTarget) &&
			(alphaSource == alphaTarget)
		);
	
		return areEqual;
	



}
