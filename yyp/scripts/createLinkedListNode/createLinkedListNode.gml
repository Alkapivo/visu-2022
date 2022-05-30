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
