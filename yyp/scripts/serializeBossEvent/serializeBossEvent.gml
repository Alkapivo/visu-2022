///@function serializeBossEvent(bossEvent)
///@description Serialize BossEvent to JSON string.
///@param {BossEvent} bossEvent
///@return {String} bossEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.475Z}

function serializeBossEvent(bossEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getBossEventType(bossEvent));	

	var bossEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bossEventJsonString;
	
}
