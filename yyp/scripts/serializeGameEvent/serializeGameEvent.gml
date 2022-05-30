///@function serializeGameEvent(gameEvent)
///@description Serialize GameEvent to JSON string.
///@param {GameEvent} gameEvent
///@return {String} gameEventJsonString 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.530Z}

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
