function forEachInMap(map, func) {
	
	var data = argument_count > 2 ? argument[2] : null;
	for (var key = mapFirst(map);
		 iteratorFinish(key);
		 key = mapNext(map, key)) {
				
		var value = map[? key];
		func(value, data);
	}	
}

function createMapFromTupleArray(tupleArray) {

	var map = createMap();
	forEachInArray(
		tupleArray,
		function(tuple, data) {
		
			addToMap(data, getTupleKey(tuple), getTupleValue(tuple));
		}, 
		map
	);
	
	return map;
}

function forEachInArray(array, func) {
	
	var data = argument_count > 2 ? argument[2] : null;
	var length = getArrayLength(array);
	for (var index = 0; index < length; index++) {
	
		var value = array[@ index];
		func(value, data);
	}
}