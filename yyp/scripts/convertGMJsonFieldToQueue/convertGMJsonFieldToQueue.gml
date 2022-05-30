///@function convertGMJsonFieldToQueue(gmjsonField)
///@description Converter. Extracted Queue is flat (not recursive)
///@param {GMJsonField} gmjsonField
///@return {Optional<Queue<Object>>} queue
function convertGMJsonFieldToQueue(argument0) {

		var gmJsonField = argument0;

		if (isDataStructure(gmJsonField, List)) {
			var queue = createQueue();
			var queueSize = getListSize(gmJsonField);
			for (var index = 0; index < queueSize; index++) {
				var item = gmJsonField[| index];
				pushQueue(queue, item);
			}
		}
	
		return createEmptyOptional();
	



}
