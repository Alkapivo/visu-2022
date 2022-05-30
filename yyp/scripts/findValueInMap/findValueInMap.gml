///@function findValueInMap(map, value)
///@description Find first key with matching value in map.
///@param {Map<T::S>} map
///@param {S} value
///@return {Optional<T>} key
function findValueInMap(argument0, argument1) {

		var map = argument0;
		var value = argument1;
	
		for (var key = mapFirst(map); iteratorFinish(key); key = mapNext(map, key)) {
			var elementValue = map[? key];
			if (elementValue == value) {
				return key;	
			}
		}
	
		return createEmptyOptional();
	



}
