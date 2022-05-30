///@function convertArrayMapToMap(arrayMap)
///@description Converter.
///@param {ArrayMap<T::S>} arrayMap
///@return {Map<T::S>} map
function convertArrayMapToMap(argument0) {

		var arrayMap = argument0;
	
		var keys = getArrayMapKeys(arrayMap);
		var values = getArrayMapValues(arrayMap);
		var keysLength = getArrayLength(keys);
		var map = createMap();
		for (var index = 0; index < keysLength; index++) {
			var key = keys[@ index];
			var value = values[@ index];
			addToMap(map, key, value);
		}
	
		return map;
	



}
