///@function popQueue(queue)
///@description Wrapper for ds_queue_dequeue.
///@param {Queue<T>} queue
///@return {T} value
function popQueue(argument0) {

		var value = ds_queue_dequeue(argument0);
		return isUndefined(value) ? createEmptyOptional() : value;
	



}
