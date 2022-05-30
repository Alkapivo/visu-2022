///@function deserializePriorityQueue(serializedPriorityQueue)
///@description Return deserializedPriorityQueue from string created by serializePriorityQueue
///@param {String} serializedPriorityQueue
///@return {PriorityQueue<Object>} deserializedPriorityQueue
function deserializePriorityQueue(argument0) {

		var deserializedPriorityQueue = createPriorityQueue();
		ds_priority_read(deserializedPriorityQueue, argument0);
		return deserializedPriorityQueue;
	


}
