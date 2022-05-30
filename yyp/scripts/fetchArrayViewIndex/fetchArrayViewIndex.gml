///@function fetchArrayViewIndex(array, indexOffset, viewSize, index)
///@description 
///@param {any[]} array
///@param {Integer} indexOffset
///@param {Integer} viewSize
///@param {Integer} index
///@return {Optional<Integer>} viewIndex
function fetchArrayViewIndex(argument0, argument1, argument2, argument3) {

		var array = argument0;
		var indexOffset = argument1;
		var viewSize = argument2;
		var index = argument3; 
	
		var arrayLength = getArrayLength(array);
		var viewIndex = fetchArrayViewBeginIndex(array, indexOffset, viewSize) + index;
		return ((viewIndex >= arrayLength) || 
				(index >= viewSize)) ?
					createEmptyOptional() : 
					viewIndex;
	



}
