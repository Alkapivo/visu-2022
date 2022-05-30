///@function serializeSystemEvent(systemEvent)
///@description Serialize SystemEvent to JSON string.
///@param {SystemEvent} systemEvent
///@return {String} systemEventJsonString 
///@throws {Exception}
///@generated {2020-12-03T01:55:41.356Z}
function serializeSystemEvent(argument0) {

		var systemEvent = argument0;
	
		var jsonObject = createJsonObject();

		appendFieldToJsonObject(
			jsonObject,
			"type",
			getSystemEventType(systemEvent));	
		appendFieldToJsonObject(
			jsonObject,
			"timer",
			getSystemEventTimer(systemEvent));	
		if (isOptionalPresent(getSystemEventData(systemEvent))) {
			appendEntityToJsonObject(
				jsonObject,
				"data",
				getSystemEventData(systemEvent),
				"ArrayMap");
		}
	

		var systemEventJsonString = encodeJson(jsonObject);
		destroyJsonObject(jsonObject);

		return systemEventJsonString;
	



}
