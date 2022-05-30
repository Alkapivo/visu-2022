///@function serializeLinkedListNode(linkedListNode)
///@description Serialize LinkedListNode to JSON string.
///@param {LinkedListNode} linkedListNode
///@return {String} linkedListNodeJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.589Z}
function serializeLinkedListNode(argument0) {

		var linkedListNode = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"value",
			getLinkedListNodeValue(linkedListNode));	
		if (isOptionalPresent(getLinkedListNodeNextNode(linkedListNode))) {
			appendEntityToJsonObject(
				jsonObject,
				"nextNode",
				getLinkedListNodeNextNode(linkedListNode),
				"LinkedListNode");
		}
	
		if (isOptionalPresent(getLinkedListNodePreviousNode(linkedListNode))) {
			appendEntityToJsonObject(
				jsonObject,
				"previousNode",
				getLinkedListNodePreviousNode(linkedListNode),
				"LinkedListNode");
		}
	

		var linkedListNodeJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return linkedListNodeJsonString;
	



}
