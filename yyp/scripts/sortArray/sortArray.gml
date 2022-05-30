///@function sortArray(array, isAscending)
///@description Sorting using ds_list_sort. Return new array.
///@param {Object[]} array
///@param {Boolean} isAscending
///@return {Object[]} sortedArray
function sortArray(argument0, argument1) {

		/*
		if (isHtml5()) {
			var jsonArrayString = tj_encode(argument0);
			var isAscendingString = argument1 == true ? "true" : "false";
			var jsonSortedArrayString = jsUtilSortArray(jsonArrayString, isAscendingString);
			if (jsonSortedArrayString == "ParseException") {
				logger("Unable to sort array: ParseException", LogType.ERROR);
				return array;
			} else {
				return tj_decode(jsonSortedArrayString);
			}
		} else {*/
			var array = argument0;
			var isAscending = argument1;
	
			var arrayList = convertArrayToList(array);
			arrayList = sortList(arrayList, isAscending);
			var sortedArray = convertListToArray(arrayList);
	
			destroyDataStructure(arrayList, List, "Unable to destroy arrayList in sortArray()");
	
			return sortedArray;
		//}	



}
