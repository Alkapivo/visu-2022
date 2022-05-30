///@function findValueInList(list, value)
///@description Wrapper for ds_list_find_index. Return null if it can not be found.
///@param {List<Object>} list
///@param {Object} value
///@return {Optional<Integer>} indexOfValue 
function findValueInList(argument0, argument1) {
	
		var indexOfValue = ds_list_find_index(argument0, argument1);
	
		return indexOfValue == -1 ? createEmptyOptional() : indexOfValue;
	
	


}
