///@function convertNumericMapToArray(numericMap, sort, isAscending)
///@description Convert Map<Number::Object> into Object[].
///@param {Map<Number::Object>} numericMap
///@param {Boolean} [sort=false]
///@param {Boolean} [isAscending=true]
function convertNumericMapToArray() {

		///checkArgumentCount(1, argument_count, convertNumericMapToArray);

		var numericMap = argument[0];
		var sort = argument_count > 1 ? argument[1] : false;
		var isAscending = argument_count > 2 ? argument[2] : true;
	
		var keys = sort ?
			sortArray(getMapKeys(numericMap), isAscending) :
			getMapKeys(numericMap);
		var keysLength = getArrayLength(keys);
		var array = createArray(keysLength);
		for (var index = 0; index < keysLength; index++) {
			var key = keys[index];
			var value = numericMap[? key];
			array[@ index] = value;
		}
	
		return array;
	



}
