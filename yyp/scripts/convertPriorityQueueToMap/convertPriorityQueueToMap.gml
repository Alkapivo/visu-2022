///@function convertPriorityQueueToMap(priorityQueue)
///@description Convert PriorityQueue to Map<Number::Object>, where key is priority.
///@param {PriorityQueue<Object>} priorityQueue
///@return {Map<Number::Object>} map
function convertPriorityQueueToMap(argument0) {
	
		var priorityQueue = argument0;

		if (isDataStructure(priorityQueue, PriorityQueue)) {
			var priorityQueueClone = clonePriorityQueue(priorityQueue);
			var priorityQueueSize = getPriorityQueueSize(priorityQueueClone);
			var map = createMap();
			for (var index = 0; index < priorityQueueSize; index++) {
				var key = findMinInPriorityQueue(priorityQueue);
				var value = popMinPriorityQueue(priorityQueue);
				map[? key] = value;
			}
	
			return map;
		} else {
			var exceptionMessage = "[convertPriorityQueueToMap] Unable to convert priority queue to map. Argument wasn't recognized as priority queue";
			throwException(createException(RuntimeException, exceptionMessage, null));
			return createMap();
		}
	



}
