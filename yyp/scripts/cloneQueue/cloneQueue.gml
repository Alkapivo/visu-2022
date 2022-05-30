///@function cloneQueue(queue)
///@description Return copy of passed queue
///@param {Queue<Object>} queue
///@return {Queue<Object>} clonedQueue
function cloneQueue(argument0) {

		var queue = argument0;
		var clonedQueue = createQueue();
		ds_queue_copy(clonedQueue, queue);
	
		return clonedQueue;


}
