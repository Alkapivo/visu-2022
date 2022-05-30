///@function getFromMap(map, key)
///@description Safe getter for map entry.
///@param {Map<T::S>} map
///@param {T} key
///@return {Optional<S>} value
function getFromMap(argument0, argument1) {

		var map = argument0;
		var key = argument1;
	
		var value = createEmptyOptional();
	
		if (isDataStructure(map, Map)) {
		
			value = map[? key];
			if (isUndefined(value)) {
			
				value = createEmptyOptional();	
			}
		}
	
		return value;
	



}
