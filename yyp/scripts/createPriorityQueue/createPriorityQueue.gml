///@function createPriorityQueue([item...])
///@description Create priority queue and insert values.
///@param {Tuple<Integer::Object>} [item...] key is priority
///@return {Priority<Object>} priority
function createPriorityQueue() {

		var priorityQueue = ds_priority_create();
		for (var index = 0; index < argument_count; index++) {
			addToPriorityQueue(priorityQueue, getTupleKey(argument[index]), getTupleValue(argument[index]));
		}
	
		return priorityQueue;


}
