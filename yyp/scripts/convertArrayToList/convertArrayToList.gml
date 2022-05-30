///@function convertArrayToList(array)
///@description Convert array to list
///@param {Object[]} array
///@return {List<Object>} list
function convertArrayToList(argument0) {

		var array = argument0;
		var list = createList();
		if (!isArray(array)) {
			logger("Unable to convert array to list, raw array data: {0}", LogType.ERROR, array);
			return list;
		}
	
		var length = getArrayLength(array);
		for (var index = 0; index < length; index++) {
			list[| index] = array[index];	
		}
		return list;
	



}
