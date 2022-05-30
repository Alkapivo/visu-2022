///@function getKeyIndexFromArrayMap(arrayMap, value)
///@description Check if any of ArrayMapItem contains passed value.
///@param {ArrayMap<Object<T>::<Object<S>>} arrayMap
///@param {S} value
///@return {Optional<Integer>} keyIndex
function getKeyIndexFromArrayMapByValue(argument0, argument1) {

		var arrayMap = argument0;
		var value = argument1;
	
		var values = getArrayMapValues(arrayMap);
		var valuesLength = getArrayLength(values);
		var keyIndex = createEmptyOptional();
		for (var index = 0; index < valuesLength; index++) {
			var arrayMapValue = values[@ index];
			if (arrayMapValue == value) {
				keyIndex = index;
				break;
			}
		}
	
		return keyIndex;
	



}
