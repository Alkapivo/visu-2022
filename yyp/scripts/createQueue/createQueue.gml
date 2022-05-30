///@function createQueue([item...])
///@description Create queue and insert values.
///@param {Object} [item...]
///@return {Queue<Object} queue
function createQueue() {

		var queue = ds_queue_create();
		for (var index = 0; index < argument_count; index++) {
			pushQueue(queue, argument[index])	;
		}
	
		return queue;



}
