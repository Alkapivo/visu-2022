///@function findMinInPriorityQueue(priorityQueue)
///@description Wrapper for ds_priority_find_min. Return null if can not be found.
///@param {PriorityQueue<Object>} priorityQueue
///@return {Object} foundValue
function findMinInPriorityQueue(argument0) {

		var foundValue = ds_priority_find_min(argument0);
		return foundValue == undefined ? null : foundValue;


}
