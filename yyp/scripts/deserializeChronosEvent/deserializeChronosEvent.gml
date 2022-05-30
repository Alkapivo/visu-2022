///@function deserializeChronosEvent(jsonString)
///@description Deserialize ChronosEvent from JSON String to ChronosEvent entity.
///@param {String} jsonString
///@return {ChronosEvent} chronosEvent 
///@throws {Exception}
///@generated {2021-05-01T23:43:41.170Z}

function deserializeChronosEvent(jsonString) {

	var jsonObject = decodeJson(jsonString);

	var instanceId = assertNoOptional(getJsonObjectFieldValue(jsonObject, "instanceId"));
	var duration = assertNoOptional(getJsonObjectFieldValue(jsonObject, "duration"));
	var handlerName = getJsonObjectFieldValue(jsonObject, "handlerName");
	var data = getJsonObjectFieldValue(jsonObject, "data", Entity, "ArrayMap");

	destroyJsonObject(jsonObject);
	
	return createChronosEvent(instanceId, duration, handlerName, data);
	
}
