///@function createArrayMap(keys, values)
///@description Constructor for ArrayMap entity.
///@param {T[]} [keys]
///@param {S[]} [values]
///@return {ArrayMap<T::S>} arrayMap 
///@throws {Exception}
///@generated {2020-07-01T13:57:12.819Z}
///@override
function createArrayMap() {

		var keys = argument_count > 0 ? argument[0] : [];
		var values = argument_count > 1 ? argument[1] : [];
	
		var arrayMap = createEntity(ArrayMap);

		setArrayMapKeys(arrayMap, assertNoOptional(keys));
		setArrayMapValues(arrayMap, assertNoOptional(values));

		return arrayMap;
	



}
