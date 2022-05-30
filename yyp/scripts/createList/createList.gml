///@function createList([item...])
///@description Create list and insert items.
///@param {Object} [item...]
///@return {List<Object>} list
function createList() {

		var list = ds_list_create();
		for (var index = 0; index < argument_count; index++) {
			addToList(list, argument[index]);	
		}
		return list;


}
