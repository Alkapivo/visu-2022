///@function reduceList(list, element) 
///@description Remove elements from list - usually use to reduce empty elements
///@param {List<?>} list
///@param {Object} [element] default value is empty optional.
function reduceList() {

		///checkArgumentCount(1, argument_count, reduceList);

		var list = argument[0];
		var element = argument_count > 1 ? argument[1] : createEmptyOptional();
		var listSize = getListSize(list);
		var listIndexMax = listSize == 0 ? 0 : listSize - 1;
		for (var index = listIndexMax; index >= 0; index--) {
			var value = list[| index]
			if (value == element) {
				deleteFromList(list, index);
			}
		}


}
