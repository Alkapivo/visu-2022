///@function deserializeChronosTask(jsonString)
///@description Deserialize ChronosTask from JSON String to ChronosTask entity.
///@param {String} jsonString
///@return {ChronosTask} chronosTask 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function deserializeChronosTask(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var chronosEvent = assertNoOptional(getJsonObjectFieldValue(jsonObject, "chronosEvent", Entity, "ChronosEvent"));

	destroyJsonObject(jsonObject);
	
	return createChronosTask(timer, duration, chronosEvent);
	
}
