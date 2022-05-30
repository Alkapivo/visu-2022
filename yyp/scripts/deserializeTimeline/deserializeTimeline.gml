///@function deserializeTimeline(jsonString)
///@description Deserialize Timeline from JSON String to Timeline entity.
///@param {String} jsonString
///@return {Timeline} timeline 
///@throws {Exception}
///@generated {2021-08-25T13:56:53.829Z}

function deserializeTimeline(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var context = assertNoOptional(getJsonObjectFieldValue(jsonObject, "context"));
	var stack = assertNoOptional(getJsonObjectFieldValue(jsonObject, "stack", Entity, "Satck<GameEvent"));

	destroyJsonObject(jsonObject);
	
	return createTimeline(time, context, stack);
	
}
