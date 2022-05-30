///@function getValueFromMap(map, key, defaultValue)
///@description Map value Getter. If value doesn't exist it will initialize it in map.
///@param {Map<String::Object>} map
///@param {String} key
///@param {Object} [defaultValue] is empty optional.
///@return {Object} value
function getValueFromMap() {

		///checkArgumentCount(2, argument_count, getValueFromMap);

		var map = argument[0];
		var key = argument[1];
		var defaultValue = argument_count > 2 ? argument[2] : createEmptyOptional();
	
		var value = map[? key];
	
		if (isUndefined(value)) {
			value = defaultValue;
			map[? key] = value;
		}
	
		return value;
	



}
