///@function convertMapToArrayMap(map)
///@description Converter.
///@param {Map<T::S>} map
function convertMapToArrayMap(argument0) {

		var map = argument0;
	
		var mapSize = getMapSize(map);
		var keys = createArray(mapSize);
		var values = createArray(mapSize);

		var index = 0;
		for (var key = mapFirst(map); iteratorFinish(key); key = mapNext(map, key)) {
			var value = map[? key];
			keys[index] = key;
			values[index] = value;
			index++;
		}
	
		var arrayMap = createArrayMap(keys, values);
	
		return arrayMap;
	



}
