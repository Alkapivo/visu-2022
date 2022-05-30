///@function getFromList(list, index)
///@description Safe getter for list element at index.
///@param {List<any>} list
///@param {Integer} index
///@return {any} element
function getFromList(argument0, argument1) {

		var list = argument0;
		var index = argument1;
	
		var element = createEmptyOptional();
	
		if (!isDataStructure(list, List)) {
	
			return element;
		}
	
		if (!isNumber(index)) {
	
			return element;
		}
	
		if ((index >= 0) && 
			(index < getListSize(list))) {
		
			element = list[| index];
		}
	
		return element;
	



}
