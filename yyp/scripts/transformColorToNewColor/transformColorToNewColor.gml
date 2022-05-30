///@function transformColorToNewColor(sourceColor, targetColor, changeFactor);
///@description Interpolate color from source to destination in time.
///@param {Color} sourceColor
///@param {Color} targetColor
///@param {Number} changeFactor normalized
///@return {Color} transformedColor
function transformColorToNewColor(argument0, argument1, argument2) {

		var sourceColor = argument0;
		var targetColor = argument1
		var changeFactor = argument2;
	
		var redSource = getColorRed(sourceColor);
		var greenSource = getColorGreen(sourceColor);
		var blueSource = getColorBlue(sourceColor);
		var alphaSource = getColorAlpha(sourceColor);
	
		var redTarget = getColorRed(targetColor);
		var greenTarget = getColorGreen(targetColor);
		var blueTarget = getColorBlue(targetColor);
		var alphaTarget = getColorAlpha(targetColor);
	
		var redFinal = redSource + changeFactor * sign(redTarget - redSource) * getDeltaTimeValue();
		redFinal = sign(redTarget - redFinal) == sign(redTarget - redSource) ? redFinal : redTarget;
	
		var greenFinal = greenSource + changeFactor * sign(greenTarget - greenSource) * getDeltaTimeValue();
		greenFinal = sign(greenTarget - greenFinal) == sign(greenTarget - greenSource) ? greenFinal : greenTarget;
	
		var blueFinal = blueSource + changeFactor * sign(blueTarget - blueSource) * getDeltaTimeValue();
		blueFinal = sign(blueTarget - blueFinal) == sign(blueTarget - blueSource) ? blueFinal : blueTarget;
	
		var alphaFinal = alphaSource + changeFactor * sign(alphaTarget - alphaSource) * getDeltaTimeValue();
		alphaFinal = sign(alphaTarget - alphaFinal) == sign(alphaTarget - alphaSource) ? alphaFinal : alphaTarget;
	
		return createColor(redFinal, greenFinal, blueFinal, alphaFinal);

	


}
