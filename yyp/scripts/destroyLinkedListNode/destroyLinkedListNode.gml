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
