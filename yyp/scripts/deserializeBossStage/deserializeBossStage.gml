///@function deserializeBossStage(jsonString)
///@description Deserialize BossStage from JSON String to BossStage entity.
///@param {String} jsonString
///@return {BossStage} bossStage 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.487Z}

function deserializeBossStage(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var name = assertNoOptional(getJsonObjectFieldValue(jsonObject, "name"));
	var timer = assertNoOptional(getJsonObjectFieldValue(jsonObject, "timer"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));

	destroyJsonObject(jsonObject);
	
	return createBossStage(name, timer, duration);
	
}
