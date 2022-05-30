///@function fetchVerticalProjectionScale(verticalPosition)
///@description Return scale factor on grid
///@param {Number} verticalPosition
///@return {Number} scaleFactor
function fetchVerticalProjectionScale(argument0) {

		var verticalPosition = argument0;

		var gridAngle = getGridRenderer().gridAngle;
		var verticalProjectionPowerFactor = clamp(gridAngle, 0.0, 1.0);		
		var verticalProjectionScale = power(verticalPosition, verticalProjectionPowerFactor);
	
		if (is_nan(verticalProjectionScale)) {
			verticalProjectionScale = 0.1
		}
	
		return clamp(verticalProjectionScale, 0.001, 1.0);
	



}
