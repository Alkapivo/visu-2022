///@function dialogueActionRewindTime(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionRewindTime(argument0) {

		var data = argument0;
	
		var result = false;
	
		var hour = getFromMap(data, "hour");
		if (isNumber(hour)) {
	
			rewindCalendarDateBy(0, hour, 0, 0);
			result = true;
		}
	
		return result;
	



}
