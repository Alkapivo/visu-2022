///@function applyInMap(map, entries)
///@description Setter for collection.
///@param {Optional<Map<T::S>>} map
///@param {Optional<Tuple<T::S>[]>} entries
///@return {Optional<Map<T::S>>} map @future, fluent api.
function applyInMap(argument0, argument1) {

		var map = argument0;
		var entries = argument1;
	
		if ((isDataStructure(map, Map)) &&
			(isArray(entries))) {
	
			var entriesLength = getArrayLength(entries);
			for (var index = 0; index < entriesLength; index++) {
		
				var entry = entries[@ index];
				if (isEntity(entry, Tuple)) {
				
					var key = getTupleKey(entry);
					var value = getTupleValue(entry);
					setInMap(map, key, value);
				}
			}
		}
	
		return map;


}
