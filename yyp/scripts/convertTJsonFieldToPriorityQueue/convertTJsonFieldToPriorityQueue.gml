///@function convertTJsonFieldToPriorityQueue(tjsonField)
///@description Converter. Extracted priorityQueue is flat (not recursive)
///@param {TJsonField} tjsonField
///@return {Optional<PriorityQueue<Object>>} priorityQueue
///@throws {ParseException}
function convertTJsonFieldToPriorityQueue(argument0) {

		var tjsonField = argument0;
	
		if (tj_is_object(tjsonField)) {
			var priorities = tj_keys(tjsonField);
			var prioritiesLength = getArrayLength(priorities);
			var priorityQueue = createPriorityQueue();
			for (var index = 0; index < prioritiesLength; index++) {
				var priority = priorities[index];
				var priorityQueueValue = tj_get(tjsonField, priority);
				if (isNumber(priority)) {
					addToPriorityQueue(priorityQueue, priority, priorityQueueValue);
				} else {
					throwException(createException(ParseException,
						stringParams("Unable to convert GMJson field \"{0}\". Found invalid priority value: {1}", priorityQueueValue, priority),
						null));
				}
			}
			return priorityQueue;
		}
	
		return createEmptyOptional();
	



}
