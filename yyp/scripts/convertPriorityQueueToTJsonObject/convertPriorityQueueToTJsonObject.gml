///@function convertPriorityQueueToTJsonObject(priorityQueue)
///@description Convert PriorityQueue to TJsonObject.
///@param {PriorityQueue<?Primitive>} priorityQueue
///@return {TJsonObject} tjsonObject
function convertPriorityQueueToTJsonObject(argument0) {

		var priorityQueue = clonePriorityQueue(argument0);
	
		var tjsonObject = tj_object();
		for (var index = 0; index < getPriorityQueueSize(priorityQueue); index++) {
			var key = string(findMinInPriorityQueue(priorityQueue));
			var value = popMinPriorityQueue(priorityQueue);
			tj_set(tjsonObject, key, value);
		}
	
		return tjsonObject;


}
