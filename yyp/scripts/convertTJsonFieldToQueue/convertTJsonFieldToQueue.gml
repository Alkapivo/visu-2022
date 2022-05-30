///@function convertTJsonFieldToQueue(tjsonField)
///@description Converter. Extracted queue is flat (not recursive)
///@param {TJsonField} tjsonField
///@return {Optional<Queue<Object>>} queue
function convertTJsonFieldToQueue(argument0) {

		var tjsonField = argument0;
	
		if (isDataStructure(tjsonField, List)) {
			var queue = createQueue();
			var queueSize = getListSize(tjsonField);
			for (var index = 0; index < queueSize; index++) {
				var item = tjsonField[| index];
				pushQueue(queue, item);
			}
		}
	
		return createEmptyOptional();
	



}
