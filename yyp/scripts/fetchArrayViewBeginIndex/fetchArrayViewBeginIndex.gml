///@function fetchArrayViewBeginIndex(array, indexOffset, viewSize)
///@description Use to determine index for collection which only a part (size of viewSize) should be accessed.
///@param {any[]} array
///@param {Integer} indexOffset
///@param {Integer} viewSize
///@return {Integer} beginIndex
function fetchArrayViewBeginIndex(argument0, argument1, argument2) {

		var array = argument0;
		var indexOffset = argument1;
		var viewSize = argument2;
	
		var arrayLength = getArrayLength(array);
		var normalizedViewSize = clamp(arrayLength - viewSize, 0, viewSize);
		var beginIndex = clamp(indexOffset, 0, arrayLength - 1);
	
		return beginIndex;
	




}
