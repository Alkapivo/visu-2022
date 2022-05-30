///@function cloneMap(map, target)
///@description Return copy of passed map.
///@param {Map<Object::Object>} map
///@param {Map<Object::Object>} [target={}]
///@return clonedMap
function cloneMap() {

		///checkArgumentCount(1, argument_count, cloneMap);

		var map = argument[0];
		var target = argument_count > 1 ? argument[1] : createMap();
		ds_map_copy(target, map);
	
		return target;
	



}
