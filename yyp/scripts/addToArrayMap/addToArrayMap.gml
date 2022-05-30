///@function addToArrayMap(arrayMap, key, value)
///@description Add item to ArrayMap.
///@param {ArrayMap} arrayMap
///@param {Object} key
///@param {Object} value
function addToArrayMap(argument0, argument1, argument2) {

		var arrayMap = argument0;
		var key = argument1;
		var value = argument2;
	
		var keys = getArrayMapKeys(arrayMap);
		var keysLength = getArrayLength(keys);
		var values = getArrayMapValues(arrayMap);
		var arrayMapIndex = keysLength;
	
		for (var index = 0; index < keysLength; index++) {
			var arrayMapKey = keys[index];
			if (key == arrayMapKey) {
				arrayMapIndex = index;
				break;	
			}
		}
	
		if (arrayMapIndex == keysLength) {
			pushArray(keys, key);
			pushArray(values, value);
		} else {
			keys[@ arrayMapIndex] = key;
			values[@ arrayMapIndex] = value;
		}
	



}
