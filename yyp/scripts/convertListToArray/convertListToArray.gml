///@function convertListToArray(list)
///@description Convert list to array
///@param {List<?>} list
///@return {?[]} array
function convertListToArray(argument0) {

		var list = argument0;
	
		if (isDataStructure(list, List)) {
			var size = getListSize(list);
			var array = createArray(size, undefined);
			for (var index = 0; index < size; index++) {
				var object = list[| index];
				array[index] = object;
			}
			return array;
		} else {
			var exceptionMessage = "Unable to convert list to array. Parameter wasn't recognized as list";
			throwException(createException(RuntimeException, exceptionMessage, null));
			return createArray(0);
		}


}
