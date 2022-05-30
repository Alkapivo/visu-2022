///@function getArrayMapValueDefault(arrayMap, key, defaultValue)
///@description Return value from map. If walue wasn't found then defaultValue will be set in ArrayMap and returned.
///@param {ArrayMap} arrayMap
///@param {Object} key
///@param {Object} defaultValue
function getArrayMapValueDefault(argument0, argument1, argument2) {

		var arrayMap = argument0;
		var key = argument1;
		var defaultValue = argument2;
	
		var keys = getArrayMapKeys(arrayMap);
		var keysLength = getArrayLength(keys);
		for (var index = 0; index < keysLength; index++) {
			var arrayMapKey = keys[@ index];
			if (arrayMapKey == key) {
				var values = getArrayMapValues(arrayMap);
				return values[@ index];
			}
		}
	
		addToArrayMap(arrayMap, key, defaultValue);
	
		return defaultValue;
	



}
