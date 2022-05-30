///@function reduceMap(map, element) 
///@description Remove elements from map - usually use to reduce empty elements
///@param {Map<T::S>} map
///@param {Object} [element] default value is empty optional
function reduceMap() {

		///checkArgumentCount(1, argument_count, reduceMap);

		var map = argument[0];
		var element = argument_count > 1 ? argument[1] : createEmptyOptional();

		for (var key = mapFirst(map); iteratorFinish(key); key = mapNext(map, key)) {
			var value = map[? key];
			if (value == element) {
				removeFromMap(map, key);	
			}
		}
	



}
