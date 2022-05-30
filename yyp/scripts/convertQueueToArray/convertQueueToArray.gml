///@function convertQueueToArray(queue)
///@description Convert queue to array.
///@param {Queue<Object>} queue
///@return {Object[]} array
function convertQueueToArray(argument0) {

		var queue = argument0;

		if (isDataStructure(queue, Queue)) {
			var queueClone = cloneQueue(queue);
			var queueSize = getQueueSize(queueClone);
			var queueArray = createArray(queueSize);
			for (var index = 0; index < queueSize; index++) {
				queueArray[@ index] = popQueue(queueClone);	
			}
			destroyQueue(queueClone);
	
			return queueArray
		} else {
			var exceptionMessage = "[convertQueueToArray] Unable to convert queue to array. Argument wasn't recognized as queue";
			throwException(createException(RuntimeException, exceptionMessage, null));
			return [];
		}
	



}
