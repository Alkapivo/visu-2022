///@function getTJsonValue(tjObject, propertyName, [defaultValue]) 
///@description Validate and get value from TJsonObject. Wrapper for tj_get
///@param {TJsonObject} tjObject
///@param {String} propertyName
///@param {Object} [defaultValue]
///@return {Optional<Object>} value.
function getTJsonValue() {

		///checkArgumentCount(2, argument_count, getTJsonValue);

		var tjObject = argument[0];
		var propertyName = argument[1];
		var defaultValue = argument_count > 2 ? argument[2] : createEmptyOptional();
	
		var value = tj_get(tjObject, propertyName);
	
		if (isUndefined(value)) {
			logger("Field \"{0}\" wasn't found in TJsonObject", LogType.ERROR, propertyName);
			value = defaultValue;
		} else {
			value = isHtml5() ? value : (tj_is_bool(value) ? value == tj_true : value);	
		}
	
		return value;
	



}
