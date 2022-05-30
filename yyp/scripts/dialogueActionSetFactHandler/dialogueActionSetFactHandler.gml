///@function dialogueActionSetFactHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionSetFactHandler(argument0) {

		var data = argument0;
	
		var factId = data[? "factId"];
		var value = data[? "value"];
		value = isTJsonBoolean(value) ? convertTJsonBooleanToBoolean(value) : value;
	
		updateFact(factId, value);
	
		return true;
	



}
