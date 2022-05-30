///@function deserializeGameEvent(jsonString)
///@description Deserialize GameEvent from JSON String to GameEvent entity.
///@param {String} jsonString
///@return {GameEvent} gameEvent 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.531Z}

function deserializeGameEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var type = assertNoOptional(getJsonObjectFieldValue(jsonObject, "type"));
	var entity = assertNoOptional(getJsonObjectFieldValue(jsonObject, "entity"));

	destroyJsonObject(jsonObject);
	
	return createGameEvent(time, type, entity);
	
}
