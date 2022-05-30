///@function setInMap(map, key, value)
///@description Safe setter for map entry.
///@param {Map<T::S>} map
///@param {T} key
///@param {S} value
///@return {Boolean} result
function setInMap(argument0, argument1, argument2) {

		var map = argument0;
		var key = argument1;
		var value = argument2;
	
		var result = false;
	
		if (isDataStructure(map, Map)) {
	
			map[? key] = value;
			result = true;
		}
	
		return result;
	



}
