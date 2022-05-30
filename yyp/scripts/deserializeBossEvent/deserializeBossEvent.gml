///@function deserializeBossEvent(jsonString)
///@description Deserialize BossEvent from JSON String to BossEvent entity.
///@param {String} jsonString
///@return {BossEvent} bossEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.475Z}

function deserializeBossEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));

	destroyJsonObject(jsonObject);
	
	return createBossEvent(type);
	
}
