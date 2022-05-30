///@function cloneList(list)
///@description Wrapper for ds_list_copy.
///@param {List<Object>} list
function cloneList(argument0) {

		var list = argument0;
		var clonedList = createList();
	
		if (isDataStructure(list, List)) {
			ds_list_copy(clonedList, list);
		} else {
			logger("Unable to clone list - passed argument wasn't recognized as list.", LogType.WARNING);	
		}
	
		return clonedList;
	



}
