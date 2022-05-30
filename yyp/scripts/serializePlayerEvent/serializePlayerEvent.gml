///@function serializePlayerEvent(playerEvent)
///@description Serialize PlayerEvent to JSON string.
///@param {PlayerEvent} playerEvent
///@return {String} playerEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.669Z}

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
