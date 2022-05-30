///@function convertTJsonBooleanToBoolean(tjsonBoolean)
///@description Converts to GMBoolean.
///@param {TJsonBoolean} tjsonBoolean
function convertTJsonBooleanToBoolean(argument0) {
	
		var tjsonBoolean = argument0;
	
		return isHtml5() ? tjsonBoolean : tjsonBoolean == tj_true;
	
	


}
