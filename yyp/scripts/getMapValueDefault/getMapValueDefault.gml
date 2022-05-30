///@function getMapValueDefault(map, key, defaultValue)
///@description Get value from map. Return defaultValue if it can not be found.
///@param {Map<Object::Object>} map
///@param {Object} key
///@param {Object} defaultValue
///@return {Object} value
function getMapValueDefault(argument0, argument1, argument2) {


		var map = argument0;
		var key = argument1;
		var defaultValue = argument2;
	
		if (!isDataStructure(map, Map)) {
			return defaultValue;
		}
	
		var value = map[? key];
		if (isUndefined(value)) {
			map[? key] = defaultValue;
			return defaultValue;
		}
	
		return value;
	



}
