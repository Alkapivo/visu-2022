///@function createMap([tuple...])
///@description Create map and insert tuples.
///@param {Tuple} tuple
///@return {Map<Object, Object>} map
function createMap() {

		var map = ds_map_create();
		for (var index = 0; index < argument_count; index++) {
			var tuple = argument[index]
			if ((isArray(tuple)) && (getArrayLength(tuple) >= 2)) {
				map[? tuple[0]] = tuple[1];
				tuple = null; 
			}
		}
		return map;


}
