///@function getMapKeys(map)
///@description Return array of map keys.
///@param {Map<Object::Object> map
///@return {Object[]} keys
function getMapKeys(argument0) {

		var map = argument0;
	
		var keys = createArray(getMapSize(map), null);
		var index = 0;
		for (var key = mapFirst(map); 
			 iteratorFinish(key); 
			 key = mapNext(map, key)) {
			 
			keys[index] = key;
			index++;
		}
	
		return keys;
	



}
