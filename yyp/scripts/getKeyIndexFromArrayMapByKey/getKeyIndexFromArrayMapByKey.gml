///@function getKeyIndexFromArrayMapByKey(arrayMap, key)
///@description Getter.
///@param {ArrayMap<Object<T>::<Object<S>>} arrayMap
///@param {T} key
///@return {Optional<Integer>} keyIndex
function getKeyIndexFromArrayMapByKey(argument0, argument1) {

		var arrayMap = argument0;
		var key = argument1;
	
		var keys = getArrayMapKeys(arrayMap);
		var keysLength = getArrayLength(keys);
		var keyIndex = createEmptyOptional();
		for (var index = 0; index < keysLength; index++) {
			var arrayMapKey = keys[@ index];
			if (arrayMapKey == key) {
				keyIndex = index;
				break;
			}
		}
	
		return keyIndex;
	



}
