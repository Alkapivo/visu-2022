///@function cloneArrayMap(arrayMap)
///@description Clone.
///@param {ArrayMap} arrayMap
///@return {ArrayMap} clonedArrayMap
function cloneArrayMap(argument0) {

		var arrayMap = argument0;
		var clonedArrayMap = createArrayMap(
			cloneArray(getArrayMapKeys(arrayMap)),
			cloneArray(getArrayMapValues(arrayMap))
		);
	
		return clonedArrayMap;
	



}
