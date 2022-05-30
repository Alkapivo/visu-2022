///@function dialogueActionRequireFactHandler(data)
///@description Handler.
///@param {Map<String::Object>} data
///@return {Booolean} result
function dialogueActionRequireFactHandler(argument0) {

		var data = argument0;
	
		var factId = data[? "factId"];
		var value = data[? "value"];
		value = isTJsonBoolean(value) ? convertTJsonBooleanToBoolean(value) : value;
	
		if (!isBoolean(value)) {
		
			throwException(
				createException(
					InvalidTypeException,
					stringParams("Action REQUIRE_FACT has mismatched property. { \"propertyName\": \"value\", \"expectedType\": \"Boolean\", \"propertyValue\": \"{0}\" }", value)
				)
			);
			clearException();
		}
	
		var result = checkFact(factId, value);
	
		return result;
	



}
