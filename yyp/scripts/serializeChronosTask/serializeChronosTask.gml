///@function serializeChronosTask(chronosTask)
///@description Serialize ChronosTask to JSON string.
///@param {ChronosTask} chronosTask
///@return {String} chronosTaskJsonString 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.226Z}

function serializeChronosTask(chronosTask) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getChronosTaskTimer(chronosTask));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getChronosTaskDuration(chronosTask));	
	appendEntityToJsonObject(
		jsonObject,
		"chronosEvent",
		getChronosTaskChronosEvent(chronosTask),
		"ChronosEvent");
	

	var chronosTaskJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return chronosTaskJsonString;
	
}
