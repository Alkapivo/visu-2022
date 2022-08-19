///@function serializeBossEvent(bossEvent)
///@description Serialize BossEvent to JSON string.
///@param {BossEvent} bossEvent
///@return {String} bossEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

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
