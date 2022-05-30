///@function findByPriorityInPriorityQueue(priorityQueue, value)
///@description Wrapper for ds_priority_find_priority. Return null if it can not be found.
///@param {PriorityQueue<Object>} priorityQueue
///@return {Object} value
function findByPriorityInPriorityQueue(argument0, argument1) {

		var foundPriority = ds_priority_find_priority(argument0, argument1);
		return foundPriority == undefined ? null : foundPriority;


}
