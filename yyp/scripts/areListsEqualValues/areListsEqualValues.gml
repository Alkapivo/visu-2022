///@function areListsEqualValues(givenList, valuesList)
///@description Check if givenList contains all elements from valueList (without repetition values)
///@param {List<Object>} givenList
///@param {List<Object>} valuesList
///@return {Boolean} areCollectionsEqual
function areListsEqualValues(argument0, argument1) {

		var givenList = argument0;
		var valuesList = argument1;
		var valuesListCopy = cloneList(valuesList);
	
		for (var givenIndex = 0; givenIndex < getListSize(givenList); givenIndex++) {
			var found = false;	
			var value = givenList[| givenIndex];
			for (var valuesIndex = 0; valuesIndex < getListSize(valuesListCopy); valuesIndex++) {
				if (value == valuesListCopy[| valuesIndex]) {
					found = true;
					deleteFromList(valuesListCopy, valuesIndex);
					break;
				}
				found = false;
			}
			if (!found) {
				return false;	
			}
		}
	
		if (getListSize(valuesListCopy) != 0) {
			return false;	
		}
	
		destroyDataStructure(valuesListCopy, List, "Unable to destroy valuesListCopy");
		return true;


}
