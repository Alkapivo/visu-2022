///@function getRightAngle(angle)
///@description Get angle normalized into right angle.
///@param {Number} angle
///@return {Number} normalizedAngle
function getRightAngle(argument0) {

		var angle = argument0;
	
		angle = angle mod 360;
	
		var normalizedAngle = 0;
		if ((angle >= 225) && (angle <= 315)) {
			normalizedAngle = 270;
		}

		if ((angle > 135) && (angle < 225)) {
			normalizedAngle = 180;
		}
		
		if ((angle < 45) || (angle > 315)) {
			normalizedAngle = 0;
		}
			
		if ((angle >= 45) && (angle <= 135)) {
			normalizedAngle = 90;
		}
	
		return normalizedAngle;
	



}
