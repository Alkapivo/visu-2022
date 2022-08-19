///@function deserializeBossStage(jsonString)
///@description Deserialize BossStage from JSON String to BossStage entity.
///@param {String} jsonString
///@return {BossStage} bossStage 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.554Z}

function deserializeBossStage(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createBossStage(name, timer, duration);
	
}
