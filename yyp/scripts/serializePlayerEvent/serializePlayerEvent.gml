///@function serializePlayerEvent(playerEvent)
///@description Serialize PlayerEvent to JSON string.
///@param {PlayerEvent} playerEvent
///@return {String} playerEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.723Z}

function serializePlayerEvent(playerEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"fields",
		getPlayerEventFields(playerEvent),
		Map);
	

	var playerEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return playerEventJsonString;
	
}
