///@function deserializeQueue(serializedQueue)
///@description Return deserializedQueue from string created by serializeQueue.
///@param {String} serializedQueue
///@return {Queue<Object>} deserializedQueue
function deserializeQueue(argument0) {

		var deserializedQueue = createQueue();
		ds_queue_read(deserializedQueue, argument0);
	
		return deserializedQueue;


}
