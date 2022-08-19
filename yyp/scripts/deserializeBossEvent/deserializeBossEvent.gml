///@function deserializeBossEvent(jsonString)
///@description Deserialize BossEvent from JSON String to BossEvent entity.
///@param {String} jsonString
///@return {BossEvent} bossEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.547Z}

function deserializeBossEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));

	destroyJsonObject(jsonObject);
	
	return createBossEvent(type);
	
}
