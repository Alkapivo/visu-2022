///@function removeFromArrayMap(arrayMap, key)
///@param Remove item with passed key from ArrayMap.
///@param {ArrayMap} arrayMap
///@param {Object} key
function removeFromArrayMap(argument0, argument1) {

		var arrayMap = argument0;
		var key = argument1;
	
		var indexToRemove = null;
		var keys = getArrayMapKeys(arrayMap);
		var keysLength = getArrayLength(keys);
		for (var index = 0; index < keysLength; index++) {
			var arrayMapKey = keys[@ index];
			if (arrayMapKey == key) {
				indexToRemove = index;
				break;	
			}
		}
	
		if (indexToRemove != null) {
			var values = getArrayMapValues(arrayMap);
			var newKeys = createArray(keysLength - 1);
			var newValues = createArray(keysLength - 1);
		
			copyArray(newKeys, 0, keys, 0, indexToRemove);
			if (indexToRemove + 1 < keysLength - 1) {
				copyArray(newKeys, getArrayLength(newKeys) - 1, keys, indexToRemove + 1, keysLength - indexToRemove);
			}
		
			copyArray(newValues, 0, values, 0, indexToRemove);
			if (indexToRemove + 1 < keysLength - 1) {
				copyArray(newValues, getArrayLength(newValues) - 1, values, indexToRemove + 1, keysLength - indexToRemove);
			}
		
			setArrayMapKeys(arrayMap, newKeys);
			setArrayMapValues(arrayMap, newValues);
		}
	



}
