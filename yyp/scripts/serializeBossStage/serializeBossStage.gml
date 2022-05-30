///@function serializeBossStage(bossStage)
///@description Serialize BossStage to JSON string.
///@param {BossStage} bossStage
///@return {String} bossStageJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.487Z}

function serializeBossStage(bossStage) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"name",
		getBossStageName(bossStage));	
	appendFieldToJsonObject(
		jsonObject,
		"timer",
		getBossStageTimer(bossStage));	
	appendFieldToJsonObject(
		jsonObject,
		"duration",
		getBossStageDuration(bossStage));	

	var bossStageJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bossStageJsonString;
	
}
