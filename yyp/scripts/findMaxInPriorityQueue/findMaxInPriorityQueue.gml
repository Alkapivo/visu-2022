///@function findMaxInPriorityQueue(priorityQueue)
///@description Wrapper for ds_priority_find_max. Return null if can not be found.
///@param {PriorityQueue<Object>} priorityQueue
///@return {Object} foundValue
function findMaxInPriorityQueue(argument0) {

		var foundValue = ds_priority_find_max(argument0);
		return foundValue == undefined ? null : foundValue;


}
