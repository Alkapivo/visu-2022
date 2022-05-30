///@function serializeBoss(boss)
///@description Serialize Boss to JSON string.
///@param {Boss} boss
///@return {String} bossJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.434Z}

function serializeBoss(boss) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"type",
		getBossType(boss));	
	appendFieldToJsonObject(
		jsonObject,
		"state",
		getBossState(boss),
		Map);
	
	appendFieldToJsonObject(
		jsonObject,
		"handler",
		getBossHandler(boss));	

	var bossJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return bossJsonString;
	
}
