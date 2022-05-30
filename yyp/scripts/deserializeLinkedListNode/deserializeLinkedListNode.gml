///@function deserializeLinkedListNode(jsonString)
///@description Deserialize LinkedListNode from JSON String to LinkedListNode entity.
///@param {String} jsonString
///@return {LinkedListNode} linkedListNode 
///@throws {Exception}
///@generated {2020-08-07T16:03:28.775Z}
function deserializeLinkedListNode(argument0) {

		var jsonString = argument0;
	
		var jsonObject = decodeJson(jsonString);

		var value = assertNoOptional(getJsonObjectFieldValue(jsonObject, "value"));
		var nextNode = getJsonObjectFieldValue(jsonObject, "nextNode", Entity, "LinkedListNode");
		var previousNode = getJsonObjectFieldValue(jsonObject, "previousNode", Entity, "LinkedListNode");

		destroyJsonObject(jsonObject);
	
		return createLinkedListNode(value, nextNode, previousNode);
	



}
