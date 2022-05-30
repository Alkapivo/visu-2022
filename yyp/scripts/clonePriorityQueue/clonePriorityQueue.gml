///@function clonePriorityQueue(priorityQueue)
///@description Return copy of passed priorityQueue.
///@param {PriorityQueue<Object>} priorityQueue
///@return {PriorityQueue<Object>} clonedPriorityQueue
function clonePriorityQueue(argument0) {

		var priorityQueue = argument0;
		var clonedPriorityQueue = createPriorityQueue();
		ds_priority_copy(clonedPriorityQueue, priorityQueue);
	
		return clonedPriorityQueue;


}
