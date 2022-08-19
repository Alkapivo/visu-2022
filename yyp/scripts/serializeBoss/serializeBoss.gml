///@function serializeBoss(boss)
///@description Serialize Boss to JSON string.
///@param {Boss} boss
///@return {String} bossJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.534Z}

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
