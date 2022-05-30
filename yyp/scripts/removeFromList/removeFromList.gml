///@function removeFromList(list, object)
///@description Remove element from list.
///@param {List<T>} list
///@param {T} object
function removeFromList(argument0, argument1) {

		var list = argument0;
		var object = argument1;
	
		var listSize = getListSize(list);
		var isGcRequired = false;
		for (var index = 0; index < listSize; index++) {
		
			var listObject = list[| index];
			if (listObject == object) {
			
				list[| index] = createEmptyOptional();
				isGcRequired = true;
				break;
			}
		}
	
		if (isGcRequired) {
			reduceList(list);	
		}
	



}
