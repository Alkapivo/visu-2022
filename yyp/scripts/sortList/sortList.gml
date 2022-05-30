///@function sortList(list)
///@description Wrapper for ds_list_sort.
///@param {List<Object>} list
///@param {Boolean} isAscending
///@return {List<Object>} list
function sortList(argument0, argument1) {

		var list = argument0;
		var isAscending = argument1;

		ds_list_sort(list, isAscending);
	
		return list;




}
