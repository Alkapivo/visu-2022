///@function deserializeTimeline(jsonString)
///@description Deserialize Timeline from JSON String to Timeline entity.
///@param {String} jsonString
///@return {Timeline} timeline 
///@throws {Exception}
///@generated {2022-08-18T22:24:59.953Z}

function deserializeTimeline(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var time = assertNoOptional(getJsonObjectFieldValue(jsonObject, "time"));
	var context = assertNoOptional(getJsonObjectFieldValue(jsonObject, "context"));
	var stack = assertNoOptional(getJsonObjectFieldValue(jsonObject, "stack", Entity, "Satck<GameEvent"));

	destroyJsonObject(jsonObject);
	
	return createTimeline(time, context, stack);
	
}
