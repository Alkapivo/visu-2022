///@export addProperty(String, value)
///@export deleteProperty(String)
///@export getProperty(String): any
///@export getPropertyBoolean(String): Boolean
///@export getPropertyReal(String, defaultValue): String
///@export getPropertyString(String, any): String

///@param {String} key
///@param {String} value
function addProperty(key, value) {

	global.properties[? key] = value;
}

///@param {String} key
function deleteProperty(key) {

	removeFromMap(global.properties, key);
}

///@param {String} key
///@param {any} [defaultValue]
///@return {any} value
function getProperty(key) {

	var defaultValue = argument_count > 1 ? argument[1] : createEmptyOptional();

	var value = global.properties[? key];	
	if (isUndefined(value)) {
			
		logger("Property \"{0}\" wasn't found. Return default value: {1}", 
				LogType.WARNING, key, defaultValue);
					
		value = defaultValue;
	}
	
	return value;
}

///@param {String} key
///@param {Boolean} [defaultValue=false]
///@return {Boolean} propertyValue
function getPropertyBoolean(key) {

	var defaultValue = argument_count > 1 ? argument[1] : false;
	
	var propertyValue = getProperty(key, createEmptyOptional());
	
	return isOptionalPresent(propertyValue) ? 
		(isTJsonBoolean(propertyValue) ? convertTJsonBooleanToBoolean(propertyValue) : propertyValue == true) : 
		defaultValue
}

///@param {String} key
///@param {any} defaultValue
///@return {String} value
///@deprecated
function getPropertyReal(key, defaultValue) {

	var property = getProperty(key, defaultValue);
	if (isOptionalPresent(property)) {
		if (isNumber(property)) {
			return property;	
		} else {
			return defaultValue;	
		}
	} else {
		return property;	
	}
}

///@param {String} key
///@param {any} defaultValue
///@return {String} value
///@deprecated
function getPropertyString(key, defaultValue) {

	var property = getProperty(key) != noone ?
		string(getProperty(key)) :
		defaultValue;
	return property;
}
