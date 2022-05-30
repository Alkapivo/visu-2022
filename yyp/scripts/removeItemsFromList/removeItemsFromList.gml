///@function removeItemsFromList(list, indexes, [destroyScript])
///@description Remove items from list.
///@param {List<Object>} list
///@param {Integer[]} indexes
///@param {AssetScript} [destroyScript] Entity destroy script
function removeItemsFromList() {

		///checkArgumentCount(2, argument_count, removeItemsFromList);
	
		var list = argument[0];
		var indexes = argument[1];
		var indexesSize = getArrayLength(indexes);
		var destroyScript = argument_count > 2 ? argument[2] : null;
		for (var index = 0; index < indexesSize; index++) {
			var itemIndex = indexes[index];
			var item = list[| itemIndex];
			if (isArray(item)) && ((destroyScript != null)) {
				script_execute(destroyScript, item);
			} else {
				logger("Unable to remove entity from list. data: {0}, script: {1}", LogType.ERROR,
				item, destroyScript);
			}
			list[| itemIndex] = null;
		}
	
		if (indexesSize > 0) {
			reduceList(list, null);	
		}
	



}
