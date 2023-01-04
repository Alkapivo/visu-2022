///@description LinkedListNode entity

///@function createLinkedListNode(value, nextNode, previousNode)
///@description Constructor for LinkedListNode entity.
///@param {Object} value
///@param {Optional<LinkedListNode>} nextNode
///@param {Optional<LinkedListNode>} previousNode
///@return {LinkedListNode} linkedListNode 
///@throws {Exception}
///@generated {2020-08-07T16:03:28.775Z}
function createLinkedListNode(argument0, argument1, argument2) {

		var value = argument0;
		var nextNode = argument1;
		var previousNode = argument2;
	
		var linkedListNode = createEntity(LinkedListNode);

		setLinkedListNodeValue(linkedListNode, assertNoOptional(value));
		setLinkedListNodeNextNode(linkedListNode, nextNode);
		setLinkedListNodePreviousNode(linkedListNode, previousNode);

		return linkedListNode;
	



}
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
///@function destroyLinkedListNode(linkedListNode)
///@description Destroy LinkedListNode entity.
///@param {LinkedListNode} linkedListNode
///@throws {Exception}
///@generated {2020-08-07T16:03:28.775Z}
function destroyLinkedListNode(argument0) {

		var linkedListNode = argument0;
	
		var value = getLinkedListNodeValue(linkedListNode);
		var nextNode = getLinkedListNodeNextNode(linkedListNode);
		var previousNode = getLinkedListNodePreviousNode(linkedListNode);
	
		if (isOptionalPresent(nextNode)) {
			destroyLinkedListNode(nextNode);
		}
		setLinkedListNodeNextNode(linkedListNode, null);
	
		if (isOptionalPresent(previousNode)) {
			destroyLinkedListNode(previousNode);
		}
		setLinkedListNodePreviousNode(linkedListNode, null);
	

	



}
///@function getLinkedListNodeNextNode(linkedListNode)
///@description Getter.
///@param {LinkedListNode} linkedListNode
///@return {Optional<LinkedListNode>} nextNode 
///@throws {Exception}
///@generated {2020-08-07T13:29:23.913Z}
function getLinkedListNodeNextNode(argument0) {

		return argument0[@ 1];
	



}
///@function getLinkedListNodePreviousNode(linkedListNode)
///@description Getter.
///@param {LinkedListNode} linkedListNode
///@return {Optional<LinkedListNode>} previousNode 
///@throws {Exception}
///@generated {2020-08-07T16:03:28.775Z}
function getLinkedListNodePreviousNode(argument0) {

		return argument0[@ 2];
	



}
///@function getLinkedListNodeValue(linkedListNode)
///@description Getter.
///@param {LinkedListNode} linkedListNode
///@return {Object} value 
///@throws {Exception}
///@generated {2020-08-07T13:29:23.913Z}
function getLinkedListNodeValue(argument0) {

		return argument0[@ 0];
	



}
///@function setLinkedListNodeNextNode(linkedListNode, nextNode)
///@description Setter.
///@param {LinkedListNode} linkedListNode
///@param {Optional<LinkedListNode>} nextNode
///@throws {Exception}
///@generated {2020-08-07T13:29:23.913Z}
function setLinkedListNodeNextNode(argument0, argument1) {

		argument0[@ 1] = argument1;
	



}
///@function setLinkedListNodePreviousNode(linkedListNode, previousNode)
///@description Setter.
///@param {LinkedListNode} linkedListNode
///@param {Optional<LinkedListNode>} previousNode
///@throws {Exception}
///@generated {2020-08-07T16:03:28.775Z}
function setLinkedListNodePreviousNode(argument0, argument1) {

		argument0[@ 2] = argument1;
	



}
///@function setLinkedListNodeValue(linkedListNode, value)
///@description Setter.
///@param {LinkedListNode} linkedListNode
///@param {Object} value
///@throws {Exception}
///@generated {2020-08-07T13:29:23.913Z}
function setLinkedListNodeValue(argument0, argument1) {

		argument0[@ 0] = argument1;
	



}
