///@function convertGMJsonFieldToPriorityQueue(gmjsonField)
///@description Converter. Extracted PriorityQueue is flat (not recursive)
///@param {GMJsonField} gmjsonField
///@return {Optional<PriorityQueue<Object>>} priorityQueue
///@throws {ParseException}
function convertGMJsonFieldToPriorityQueue(argument0) {

		var gmJsonField = argument0;

		if (isDataStructure(gmJsonField, Map)) {
			var priorityQueue = createPriorityQueue();
			for (var priority = mapFirst(gmJsonField); iteratorFinish(priority); priority = mapNext(gmJsonField, priority)) {
				var priorityQueueValue = gmJsonField[? priority];
				if (isNumber(priority)) {
					addToPriorityQueue(priorityQueue, priority, priorityQueueValue);
				} else {
					throwException(createException(ParseException,
						stringParams("Unable to convert GMJson field \"{0}\". Found invalid priority value: {1}", priorityQueueValue, priority),
						null));
				}
			}
		}
	
		return createEmptyOptional();
	



}
