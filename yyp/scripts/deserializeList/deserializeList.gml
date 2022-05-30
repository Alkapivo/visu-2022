///@function deserializeList(serializedList)
///@description Return deserializedList from string created by serializeList
///@param {String} serializedList
///@return {List<Object>} deserializedList
function deserializeList(argument0) {

		var list = createList();
		ds_list_read(list, argument0);
		return list;


}
