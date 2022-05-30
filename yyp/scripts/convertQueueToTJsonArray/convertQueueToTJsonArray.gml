///@function convertQueueToTJsonArray(queue)
///@description Convert Queue to TJsonArray.
///@param {Queue<?Primitive>} queue
///@return {TJsonArray} tjsonArray
function convertQueueToTJsonArray(argument0) {

		var queue = cloneQueue(argument0);
		var queueArray = createArray(getQueueSize(queue), null);
		for (var index = 0; index < getQueueSize(queue); index++) {
			queueArray[index] = popQueue(queue);	
		}
	
		return tj_array(queueArray);


}
