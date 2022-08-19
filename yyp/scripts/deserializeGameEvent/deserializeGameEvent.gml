///@function deserializeGameEvent(jsonString)
///@description Deserialize GameEvent from JSON String to GameEvent entity.
///@param {String} jsonString
///@return {GameEvent} gameEvent 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.582Z}

function deserializeGameEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var entity = assertNoOptional(getJsonObjectFieldValue(jsonObject, "entity"));

	destroyJsonObject(jsonObject);
	
	return createGameEvent(time, type, entity);
	
}
