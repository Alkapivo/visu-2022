///@function getValueFromArrayMap(arraymap, key)
///@description Getter.
///@param {ArrayMap} arrayMap
///@param {Object} key
///@return {Optional<Object>} value
function getValueFromArrayMap(argument0, argument1) {

		var arrayMap = argument0;
		var key = argument1;
	
		var keys = getArrayMapKeys(arrayMap);
		var keysLength = getArrayLength(keys);
		var result = createEmptyOptional();
		for (var index = 0; index < keysLength; index++) {
			var arrayMapKey = keys[@ index];
			if (arrayMapKey == key) {
				var values = getArrayMapValues(arrayMap);
				result = values[@ index];
				break;	
			}
		}
	
		return result;
	



}
