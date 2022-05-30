///@function dialogueActionRequireTime(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionRequireTime(argument0) {

		var data = argument0;
	
		var startHour = getFromMap(data, "startHour");
		var endHour = getFromMap(data, "endHour");
	
		var result = false;
	
		if ((isNumber(startHour)) && 
			(isNumber(endHour))) {

			var currentHour = getCurrentHour();
			if ((result > startHour ) && 
				(result < endHour)) {
		
				result = true;
			}
		}
	
		return result;
	



}
