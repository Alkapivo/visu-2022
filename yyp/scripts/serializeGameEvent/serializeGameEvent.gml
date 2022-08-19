///@function serializeGameEvent(gameEvent)
///@description Serialize GameEvent to JSON string.
///@param {GameEvent} gameEvent
///@return {String} gameEventJsonString 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function serializeGameEvent(gameEvent) {

	var jsonObject = createJsonObject();

	appendFieldToJsonObject(
		jsonObject,
		"time",
		getGameEventTime(gameEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"type",
		getGameEventType(gameEvent));	
	appendFieldToJsonObject(
		jsonObject,
		"entity",
		getGameEventEntity(gameEvent));	

	var gameEventJsonString = encodeJson(jsonObject);
	destroyJsonObject(jsonObject);

	return gameEventJsonString;
	
}
